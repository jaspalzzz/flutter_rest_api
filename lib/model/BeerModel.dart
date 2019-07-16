class BeerModel {
  var id;
  var name;
  var tagline;
  var firstBrewed;
  var description;
  var imageUrl;
  var abv;
  var ibu;
  var targetFg;
  var targetOg;
  var ebc;
  var srm;
  var ph;

  BeerModel(
      {this.id,
        this.name,
        this.tagline,
        this.firstBrewed,
        this.description,
        this.imageUrl,
        this.abv,
        this.ibu,
        this.targetFg,
        this.targetOg,
        this.ebc,
        this.srm,
        this.ph});

  BeerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];
    firstBrewed = json['first_brewed'];
    description = json['description'];
    imageUrl = json['image_url'];
    abv = json['abv'];
    ibu = json['ibu'];
    targetFg = json['target_fg'];
    targetOg = json['target_og'];
    ebc = json['ebc'];
    srm = json['srm'];
    ph = json['ph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tagline'] = this.tagline;
    data['first_brewed'] = this.firstBrewed;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['abv'] = this.abv;
    data['ibu'] = this.ibu;
    data['target_fg'] = this.targetFg;
    data['target_og'] = this.targetOg;
    data['ebc'] = this.ebc;
    data['srm'] = this.srm;
    data['ph'] = this.ph;
    return data;
  }
}