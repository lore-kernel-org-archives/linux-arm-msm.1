Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D486A47CA79
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425798; cv=none; b=eKp1mwR4gt56K6+tUF3edRwJxKysSwywo10kHtmeVmnqMhM6Tc6ricboob3TcQA0LpbXSNobuDMJRmIRZ4CrktUgce/h7SZF/G+g3ifDS9vN4xRfnmJY3VdaAGwifaFmv3EOGQCsa0uHKSIlDUeHYOC118zG7bibWeMGlV9nbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425798; c=relaxed/simple;
	bh=s+WM17+wy+w97Nd0SVsUPfPKHG6tJqD5wyyV11TwqOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulNvYB9QlCAChU5sfZLWFzQn/bstq0TvcuNuApqObaq0+shxm97XrMA6fpBEL3tiHdn6WD5wsVIFdHIFQu89NkxVwuasA7/pgcSvW9QHw2PNTxczORVu0i/rKIvCXncxoA2WUqd36fsmY51Ij2sIYP0hBGWvU4x5BMXVMCbQVys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4CWQYls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buL6oEon; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4CWQYls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buL6oEon"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lK67721295
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 08:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s+WM17+wy+w97Nd0SVsUPfPK
	HG6tJqD5wyyV11TwqOo=; b=T4CWQYls73PuDS12PTaMYLyNbudm/dKPjQ9Ff3TW
	QEjMErLPhs/7YwPQjbzvd/WMdYypCgGdruKTfW4HxRaggJO0vv/E7P8ZTNizUsFL
	ZX6xGYSsAO6fVF04khBMm/wz2vKizPzqI9UtV8kMhw1m8Byktk3odT9GBNcKa5OX
	XFo+zK3rUUEzi6TLWYI6fbspFfdGa6/WjLAG7CZMrgPHnsU7JGwDOUibqzLk+96w
	87h2hmRCloc9LbAQxejrtQTuQVPmcXSjIcKLgWyXyteiOyUIj7q2TAqIcY8Dsk5c
	0uQmp/ZfzgnRdM3hq8PV9nnmJvR47XrkBiSyhXdppXcVLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnm6kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:56:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so552580585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788425794; x=1789030594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s+WM17+wy+w97Nd0SVsUPfPKHG6tJqD5wyyV11TwqOo=;
        b=buL6oEon7iGr3AUJrNg5Q1wNxvva0JNmp/Yswd7HUVM5b49dYcbxRgwDGCIDxyzp0a
         TdVKd6/59RzBYS6WCHhxHyDUQST6STwfYALGZyc1D5Yfj10NIZlWcf+VTEnnr2yh1K3b
         mCLKn9qWTumMOPUAKgI3Xa9ZmmSJkWDp8k0FBXL2+VRzhoWxFnUuIeWWfAJ71DvgEQVp
         i/6v15rG9hkw3luENYTC0rsGrjk08iFLXiiXtd6mWu+K9OMo8LXsqwYfKBAOgqv2KZmC
         4G9K4hcMVKC0RfG1lr7C9ozPm+2JpWiPa1O9IRbKs6pDw+pJD+iXF5k3rnNRFx/yj/v5
         1wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425794; x=1789030594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+WM17+wy+w97Nd0SVsUPfPKHG6tJqD5wyyV11TwqOo=;
        b=RmR7zckfyxxDSicsH0UKNY1jPGIR3AuK+YO5JPfT/CHydfRaxAzhFn1eBidwmr4PBu
         2vzkFYo0VqIlDVZrrcsCcQH4RpVkYA2X/2D1TD92qXoydBpdi3GjtIdUYSmhufgN36RE
         rzabKHgnGPbONglv+5nfhi0S1ljYUxeQntMwFJKNm+67vjKCXM1mx3hciPJ+UE95oXKY
         Flyo5IaihpxSrkKBS5qBbGDNeYRazrtz+mW9PFhCatPyugv4jS/Lfftvql2FGiw2Rn1c
         FXFJKCkI4zcotW2kOD3+GSPlu79EnZ8nqokhZFSPOVBoDf5AWF3+n1EsYxIMGTDu3Kyv
         oUUg==
X-Forwarded-Encrypted: i=1; AKwUvBy7e3CgldYMH8Z640BY5+FzKfgNIC5Pe66Tu27nsCRJzDbq1EgvbhVwVobGV64SC1ejJuoRzeAdGH0/voQn@vger.kernel.org
X-Gm-Message-State: AFuF++lhFaSpe72KsOo7/uNaAeWJOa035hmsM6dhT56OVmfcbGM2rmat
	5XP12MVOCLBTqO5lpBFpnAJrBq3EBMcHTcmy2wOxmpZsd9GSzHEdrRobUdfhdXGHOoKi6qUqaNZ
	YBUBJpgVYC/MZCdjnoeD1HItNG7t+KObJlxnfeT2p5VywWAF2KEbXQKtsSyc9xAXdUn8k
X-Gm-Gg: AYBFou2xjM3bN3Idqs+fActrhkv1iicC2o6SIJuBva8SpQwZ6IK2JHz5qXwG74sigtq
	mXugiO50GF+KEcc9+M9Jg/+F0VZaNPc/8LMzbZ8n0tdyJH8sf9uYUWZ4brVRf7PuBtPGbybvvCF
	Hn0e5aDdv/6Rwf6UTNkDvu2QHZedHQTStvyNIc8u6+FVPBGFDh7Me3uE2d4VipDsFh8DLQbfPHj
	yjunPOhjKmHdMCITHPSraOg7SymIBYtl5QTGrRHyrV60czFfPYCahNj2LKyIhEONA58mhh6Fx2w
	EYFJypK8WHDO0Fy1fXuPi+Ci1ApHtgY1rHUt5zboPPxZAhV2gjlisQqVl9XoshlJM96N3Bp+Pdz
	v9ZgtbK35lnCIQw==
X-Received: by 2002:a05:620a:271d:b0:939:6de8:43dc with SMTP id af79cd13be357-9396de84598mr660438785a.48.1788425793619;
        Thu, 03 Sep 2026 01:56:33 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:939:6de8:43dc with SMTP id af79cd13be357-9396de84598mr660435785a.48.1788425793041;
        Thu, 03 Sep 2026 01:56:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm12132859f8f.16.2026.09.03.01.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:56:32 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:56:31 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v2 2/5] gpio: tc9563: add support for the embedded GPIO
 controller
Message-ID: <apk2PzowUumzH_Ly@lore-desk>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
 <20260903-pci-tc9563-aux-v2-2-34c625b542c1@oss.qualcomm.com>
 <CAMRc=Mf6-7Y7nDvBA-zpw10_EeQ9mr+TkLfr_msBU7EU58LQ=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OVTXnIBT/tYhlLRp"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf6-7Y7nDvBA-zpw10_EeQ9mr+TkLfr_msBU7EU58LQ=A@mail.gmail.com>
X-Proofpoint-GUID: WBEbMgsGE1bI6pUk6gUQ0vFzHjCGwrRK
X-Proofpoint-ORIG-GUID: WBEbMgsGE1bI6pUk6gUQ0vFzHjCGwrRK
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a993642 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ee_2aqc6AAAA:8 a=QdqtlxgJISnalKBtFgoA:9 a=CjuIK1q_8ugA:10
 a=GUhdYjh1zgis1m3ksQcA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXxZT4qTNf5Oq2
 M9M8+51Ks9ODIL6F0T+OGyspadF4wUPeUGyDPMfnnPrI0I7JQuo+STL6bSfDdgXdPUJYq4ARtUq
 lQlY3Qw3c1k+HhHxowu/HJg8xh8itqOIsT2nRA/L+VsnrxpAukw4fXO4ghFc6Yh94IlaanNfS2n
 uDLmym/I76FEdJZ1EPvhRi4ab1fnWxGcMODrpXRSUqEWWrZjjhNAp2KXx263eBg3Gg8rCh/pVJo
 chTwkD3o1stzrxlKACUnbmYM54v0Ly6b0ucbIV1oPjqh9HwOIU+whfsAzrHav2xUBL/wvLPGpBu
 /U61sQxUGCivWM2lfdzybF8czBgOM0VxJXP31ZTph8O8/oOO0sn8YWuqWc7ZA6XIWGVUGaFbio5
 L2D7RzuiwtZxqgnt66PXlTTBYAzGOhN3fLh5j4M3fSIpw76e6m/kr/H96eJzNg80l8kIsGT4CiF
 rGuD3JF0wmH37DaO9Ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXyvnrDq5SpY+Z
 77shw27Rm442Y0/0dqvrCIUcngsvVecjMjBrb8kkTopFGSiT/Osm9THD4cawdejcl3Cb8W8JvUQ
 20/WEu4Oeywwl795EzWxHcunX1IjMhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030077

--OVTXnIBT/tYhlLRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 3 Sep 2026 09:52:58 +0200, Lorenzo Bianconi
> <lorenzo.bianconi@oss.qualcomm.com> said:
> > From: Alex Elder <elder@riscstar.com>
> >
> > Add a driver for the GPIO controller embedded in the Toshiba TC9563
> > PCIe switch (and the Qualcomm QPS615). The device implements 35
> > GPIOs using two register banks: three registers control the first 32
> > GPIOs (20 and 21 are reserved) and three more control GPIOs 32-36.
> > GPIOs 22-24, 27-28, 31, and 34 are input-only.
> >
> > The driver is registered as an auxiliary device driver; the TC9563
> > power controller creates the auxiliary device and provides a regmap
> > that gives access to the GPIO registers, so the gpio-regmap helpers
> > are used to implement the GPIO chip.
> >
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
>=20
> Looks good to me. What is the merge strategy? If you want Bjorn to take it
> through the PCI tree:
>=20
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Hi Bartosz,

thx for the review. I am completely fine if this series goes via pci tree.

Regards,
Lorenzo

--OVTXnIBT/tYhlLRp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapk2PwAKCRA6cBh0uS2t
rL9GAP42pYHv0DqXiAJEOnJW25UpKh1ja9yTXZSetPI8q0DLswEAmO1vrIStPQ/j
eYwzySrIWS6Bb0DotcwTu4UQ9xF2YQM=
=prqZ
-----END PGP SIGNATURE-----

--OVTXnIBT/tYhlLRp--
