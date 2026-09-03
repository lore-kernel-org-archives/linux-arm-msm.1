Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D06349CD7
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425843; cv=none; b=jDA1l1SXDfbCl6JEERr4LPD+1vLEDcYkz1cPVHxpUoeEkOewsg7Z9K4n0NP5kutcJeaf5Z390TIBCdWoOQvzSAmaS4HV84OUaif4xNUJWfiH4poPtB1tb1X6AtzEiasqfiF31jfCrhqWoWKyEGqxRTeR2ZZ+UBw8OO2qgiUO2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425843; c=relaxed/simple;
	bh=1Mn4BcgjHqDobiYyDpI2n+wnu9b1J//ZPYsru93fCT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9rIGtk22PyEpztWP4qf9XMUEHW/4vu9WEpQsXG8909yCRkgny1xqnVKsRTtPLVRy5+1jEOHMK1ZUOENoUBNXwyPxTUCIh1hwckaPSZpyfwZt5t114JLrK7rxHlxxi/VHcWdMeTxL5xanOzsh53yAxFYg2bWrzwiPywyR3SY1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuIBvsOP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ep03TFWU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuIBvsOP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ep03TFWU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68382R6I3549486
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 08:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mH3o0RXrBVCerfzSmyAEFqJb
	hCVag6r+YQ8oHN/r4ck=; b=GuIBvsOPnr6POTPqWUKlOms8YqWC1R8povoq0Znf
	v88uribvODzu6URnbk7L9ASZk8j0yoi/1KgTDnrcP8i2N6ntRdfOpombkGhLAQIe
	VyoFajVSwWjP7tkkIligOUoWK8YswuFfqlm/QIo9YaFsnO5TkQamIjodmLpQJ5Kx
	uW6r/X5bH5Dhv4NrJ7uVjCJ6V9TS6VdchjHx0Q8/4M8Nsc/lLAMN9YMU09JV61+1
	KigaR1XvLwtBEorwAlcYkGZC30X3K4qzgYjA0fbFO4KbKe9/rGD2CT2Prx3anTK2
	yZGNkqzDyADagwIihaX/mZM2Sx2dlmfuZuj6og+aESyL3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m078d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:57:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903982af1so546449685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425840; x=1789030640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mH3o0RXrBVCerfzSmyAEFqJbhCVag6r+YQ8oHN/r4ck=;
        b=ep03TFWUtBaXckfzGy7BqNFtyZdaSi/KMTjgFv5S6JXgD9tHuxkWIwLzxLOT9Ia6ug
         F96ewuHnGQGYlx3XZhIQvgMkhl76EIQAaz/07v0l7W2HJGx5HOksM5BMsYQx85IbWkTa
         osATedNR6Buc09yCy/iPLvrAUR7OgwdyZUBhXc6coVTiW5P5N0vhOi3B3nsoIy6g7/C/
         mWWOgJ5NZ7Jz8HsAEekiK+X/1sY50b9qB12F3YickVGRhkGa5jDpAaZ9+47rIrzMyyWL
         r4AOk/HWAP/0BP0WjbNW7WMomHz8u0jHn9cF9Jmi2eiPBmli21fsw3uQAAlgdoC5LAGF
         5pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425840; x=1789030640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mH3o0RXrBVCerfzSmyAEFqJbhCVag6r+YQ8oHN/r4ck=;
        b=oY5ivBun9dhBeqBwLKdkW1BJGbiSNUs3hBXtbW8/AK1Bg6C/BLe52dEs/+77XHRjUS
         29cprJv2zYczFrkAaEA7TtSHKNy8sswzsVsSJz6Wljt4zhPKgdy3hB3XiGP7CYSDH/EP
         BmqS5L4IiXfZVhYDwKhYnCVW92x2aAE7eqH+MJjuWMr902MNLiwo14KbaPlna7oTvbMG
         UHAZuvjxSTvutFiBbaiP/cvatoTL+JQSZaL3BmbmEfKU8KVAzZvtdJjgFA8n/hwi9oH2
         DMTyUVj/QBhvb4UsDx3+/v81dTTrN5W2rzgujHmGoWhhtr5gUlghyBqZwwVdh08+9kH1
         6iZg==
X-Forwarded-Encrypted: i=1; AKwUvBwMkKpHVS9P5TLfvU0f144zquxfoY7t49yi/dK6EP3oxjbavgjWmigUvty3FrcQAVMLVKrs/iTAfJlYLDw/@vger.kernel.org
X-Gm-Message-State: AFuF++kd05k8minzI6kPKKTil11J4tpgDgsnpWbiCotB7OqcXB/fdPG2
	EfsiL6HaHKMyKmLpy2ot5hVk4BjGZuRbUIyl8oveA+yy3kzzb+pxIJfO84DbinhFCwXpJYS/Dfs
	hHZDVP2lw5GuTC8lOfQnpwCZreuPBkIDLIjGNiSQkFANJcRuWf4g3nPS/GeX+ICXGdWw9
X-Gm-Gg: AYBFou3u5ndW6qGtkDZ48iq87ZLr3FWQFlwg6swLNjFO+I9VDBSQM+m6Hkx9jTwsJPQ
	jf2fjP3mzieiOnh51e6ziRl2A4KYm2Irh8cgBCn9ST/dHeZAtomW5XjsyN9rRF5hwof5hyJB9Tg
	wzKRRxfltjcus7FkDvKruKkhJL9jv91W61m/M8fglpzMQ778YFZUhe2EBRHGlfexJqr/UCTG/f+
	80Cr6Dd57qSYIk2fAKa0Xmfafk99MWkZyoMyaZv1I234K26svNISmJy1vaAiI6tn8kogohqYl8r
	R7THzPvqiaAkTxglye2NveD9Bkr0wrPLXD1fQWclNnrAY97vp7pQpUy3L2sfI+EGkyqjQMEKexO
	WfRnPq9arGmrrMg==
X-Received: by 2002:a05:620a:2944:b0:92e:5b92:98bb with SMTP id af79cd13be357-93960deb975mr1139729585a.14.1788425839508;
        Thu, 03 Sep 2026 01:57:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2944:b0:92e:5b92:98bb with SMTP id af79cd13be357-93960deb975mr1139725285a.14.1788425838888;
        Thu, 03 Sep 2026 01:57:18 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm59540455e9.14.2026.09.03.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:57:17 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:57:17 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, Alex Elder <elder@riscstar.com>,
        Daniel Thompson <daniel@riscstar.com>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/5] PCI/pwrctrl: tc9563: add GPIO auxiliary device
 support
Message-ID: <apk2bd66H6hP_uR0@lore-desk>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
 <20260903-pci-tc9563-aux-v2-3-34c625b542c1@oss.qualcomm.com>
 <CAMRc=MdpUaJ8sJczbN592wncBZvdhaUW2rcA3CjyxS8fPKAoGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RoZLkDf68al4Rhem"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdpUaJ8sJczbN592wncBZvdhaUW2rcA3CjyxS8fPKAoGw@mail.gmail.com>
X-Proofpoint-GUID: k6RkcVkYpLvRrQXrdBtTJF-IDcRhn_xD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX0uzZ7tiqI2lX
 bslsK17JTBeMmOEK00rFXf1/jo19R6hbS0MaEbU1qzazzmOBYdkmpe3HVet6crqJ8nClWrdEAZH
 trHY1LZIs58uOkJYR8D3lSVEhECTd1PAb/8F/KGxcPnWJDOHE10B7i1aNCkBsxs4ic08gJdfg+x
 VANd1s3G/z8s9N03ZOJPjQ4oQRzcIReT6t8DiZrUrDVnooWAm5cCSwjuqjuTItjwuXyyNR6LFZE
 SmZQrVfOS56Yeu349B8gJ+APrR5mYDNIKQITZWHcXlACpoZ7TX2T8+7pRe4zso+vjmqfMN4Gsld
 KE+ueogtTmp0aABB67HGs3pGDaM2GVG5SnJntemUzc11wD+EaauTWFsZUFnlapNsl9Kf4yB2cpu
 qyESFqQx9FyM3DpbBtfabtoUqFg+VkEJFNbr67rvBYwXapL7AEVULmMH+LQQL9Q1lH39p/sTuPY
 xNzgi8S+gSaL595wLmA==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a993670 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lM7qx0wEhktSdUV_m9MA:9 a=CjuIK1q_8ugA:10 a=CAIs8WcTJ8Yun8YYCucA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX7dR9wotokaWD
 WF6h/Y3O7bgYenyZi2cghqnq0KuBSz0KdZiIBbxvkHcvVCx8tXRebxOcoFB+jbPSMuAznxC0ndh
 svDhJi+NoZGOJVj1+qocMsASjpr4XQg=
X-Proofpoint-ORIG-GUID: k6RkcVkYpLvRrQXrdBtTJF-IDcRhn_xD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077

--RoZLkDf68al4Rhem
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 3 Sep 2026 09:52:59 +0200, Lorenzo Bianconi
> <lorenzo.bianconi@oss.qualcomm.com> said:
> > The TC9563 embeds a GPIO controller used for per-port reset signals.
> > Create an auxiliary device for it so the gpio-tc9563 driver can
> > register the GPIO chip and enable DT-based GPIO lookups. Pass the
> > tc9563 regmap to the auxiliary device as its platform data.
> >
> > The downstream port DT parsing loop gains an of_node_is_type() filter
> > to skip non-PCI child nodes such as the GPIO controller node.
> >
> > The pwrctrl driver does not wait for the GPIO chip to be probed. The
> > per-port reset GPIO lookup, returning -EPROBE_DEFER until the chip is
> > registered, is added in the next patch.
> >
> > Select AUXILIARY_BUS and GPIO_TC9563 in Kconfig.
>=20
> It's no longer true and also, it's clear from the patch so we don't have =
to
> have it in the commit message.

ack, it is just a leftover of v1. I will fix it.

Regards,
Lorenzo

>=20
> >
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> >  drivers/pci/pwrctrl/Kconfig              |  1 +
> >  drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 80 ++++++++++++++++++++++++=
++++++--
> >  2 files changed, 78 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> > index 1952ab4f29b6..38aab596aa04 100644
> > --- a/drivers/pci/pwrctrl/Kconfig
> > +++ b/drivers/pci/pwrctrl/Kconfig
> > @@ -29,6 +29,7 @@ config PCI_PWRCTRL_TC9563
> >  	select PCI_PWRCTRL
> >  	default m if ARCH_QCOM
> >  	depends on I2C
> > +	depends on GPIO_TC9563
> >  	select REGMAP_I2C
> >  	help
> >  	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > index b0d8912690a2..6df512d78b54 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > @@ -4,11 +4,13 @@
> >   */
> >
> >  #include <linux/array_size.h>
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/bits.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -20,12 +22,10 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/string.h>
> >  #include <linux/types.h>
> > +#include <linux/soc/qcom/tc9563.h>
> >
> >  #include "../pci.h"
> >
> > -#define TC9563_GPIO_CONFIG		0x801208
> > -#define TC9563_RESET_GPIO		0x801210
> > -
> >  #define TC9563_PORT_L0S_DELAY		0x82496c
> >  #define TC9563_PORT_L1_DELAY		0x824970
> >
> > @@ -393,6 +393,73 @@ static int tc9563_pwrctrl_parse_device_dt(struct d=
evice_node *node,
> >  	return 0;
> >  }
> >
> > +static void tc9563_pwrctrl_adev_release(struct device *dev)
> > +{
> > +	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> > +
> > +	of_node_put(adev->dev.of_node);
> > +	kfree(adev);
> > +}
> > +
> > +static void tc9563_pwrctrl_adev_remove(void *data)
> > +{
> > +	struct auxiliary_device *adev =3D data;
> > +
> > +	auxiliary_device_delete(adev);
> > +	auxiliary_device_uninit(adev);
> > +}
> > +
> > +static int tc9563_pwrctrl_adev_add(struct device *dev, const char *nam=
e,
> > +				   u32 id, struct device_node *of_node,
> > +				   void *priv_data)
> > +{
> > +	struct auxiliary_device *adev;
> > +	int ret;
> > +
> > +	adev =3D kzalloc_obj(*adev);
> > +	if (!adev)
> > +		return -ENOMEM;
> > +
> > +	adev->id =3D id;
> > +	adev->name =3D name;
> > +	adev->dev.parent =3D dev;
> > +	adev->dev.platform_data =3D priv_data;
> > +	adev->dev.release =3D tc9563_pwrctrl_adev_release;
> > +	adev->dev.of_node =3D of_node_get(of_node);
>=20
> Ah you're doing it because .release() will be called if auxiliary_device_=
add()
> fails. It's fine I guess.
>=20
> > +
> > +	ret =3D auxiliary_device_init(adev);
> > +	if (ret) {
> > +		of_node_put(adev->dev.of_node);
> > +		kfree(adev);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D auxiliary_device_add(adev);
> > +	if (ret) {
> > +		auxiliary_device_uninit(adev);
> > +		return ret;
> > +	}
> > +
> > +	return devm_add_action_or_reset(dev, tc9563_pwrctrl_adev_remove, adev=
);
> > +}
> > +
> > +static int tc9563_pwrctrl_add_gpio_adev(struct tc9563_pwrctrl *tc9563)
> > +{
> > +	struct device *dev =3D tc9563->pwrctrl.dev;
> > +	struct fwnode_handle *fwnode;
> > +	int ret;
> > +
> > +	fwnode =3D gpiochip_node_get_first(dev);
> > +	if (!fwnode)
> > +		return 0;
> > +
> > +	ret =3D tc9563_pwrctrl_adev_add(dev, TC9563_GPIO_DEV_NAME, 0,
> > +				      to_of_node(fwnode), tc9563->regmap);
> > +	fwnode_handle_put(fwnode);
> > +
> > +	return ret;
> > +}
> > +
> >  static int tc9563_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
> >  {
> >  	struct tc9563_pwrctrl *tc9563 =3D container_of(pwrctrl,
> > @@ -565,6 +632,9 @@ static int tc9563_pwrctrl_probe(struct platform_dev=
ice *pdev)
> >  	 */
> >  	port =3D TC9563_USP;
> >  	for_each_child_of_node_scoped(node, child) {
> > +		if (!of_node_is_type(child, "pci"))
> > +			continue;
> > +
> >  		if (++port >=3D TC9563_MAX)
> >  			break;
> >
> > @@ -596,6 +666,10 @@ static int tc9563_pwrctrl_probe(struct platform_de=
vice *pdev)
> >  	tc9563->pwrctrl.power_on =3D tc9563_pwrctrl_power_on;
> >  	tc9563->pwrctrl.power_off =3D tc9563_pwrctrl_power_off;
> >
> > +	ret =3D tc9563_pwrctrl_add_gpio_adev(tc9563);
> > +	if (ret)
> > +		goto remove_i2c;
> > +
> >  	ret =3D devm_pci_pwrctrl_device_set_ready(dev, &tc9563->pwrctrl);
> >  	if (ret)
> >  		goto power_off;
> >
> > --
> > 2.55.0
> >
> >
>=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

--RoZLkDf68al4Rhem
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapk2bQAKCRA6cBh0uS2t
rNJ8AQCcDI8uZtGWv9Di/c/5jYpjYqbejNgW+BXSETXLqop7SAEA3W1BsmHT9rPr
ffpTRwj8b5iZCh9Z9PKAuPWQWTutbQQ=
=ZeZC
-----END PGP SIGNATURE-----

--RoZLkDf68al4Rhem--
