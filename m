Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309046D0B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195366; cv=none; b=dCB3sRydNiSSqTrXGVYUbaWSacOcJUl8AtIg3XeEtMBD+yjlRvM8BncdCxdRJb9DcwarZH4YpjMZBE3lzvj5PmJV6ps0deMhjR9eNbDuTlLeeRxMnQWqqSEwMiwSz9+2rj8Ijw0OSCP2RnT7VmhOxBPp0J9+9JVEEoIKeHg9Mes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195366; c=relaxed/simple;
	bh=DVmzVfeaZlZ2h7sO+MtrgVWEGeTM3AcsBlWGq/2QyLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nB73l0dPg9JWKVsmDV5gWPL9MnN5TXIb/BmdD+X244hJSQUJCVXWhJPMG9rkAIsBr3yI3MH4EiUtlWzqiipKmjhPOf4ZuqCk/k5xvEB0zgfNG0zZwjn6bMOGm1z6l1pmVkNjlZS1otnjgM2tsFCyoAuGIAd/DxmiwIYLprv7S8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5UP1ywy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZA+DWE+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5UP1ywy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZA+DWE+F"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJluRI650624
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 20:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ktq8FOEiqAS2HqdwxrfUyjEp
	XI5UTr/iZCY9k3s5bK8=; b=C5UP1ywyVrr67lED7xiUGlA7iWZBSWr5X45i6FXl
	ggzSSIx4KP7fDELiL7xS9mDpdREPRSIC9InDhpFdkeY9y2u8lyMmMN/7ep54lL0u
	LPhXlio2ZY7XSuTTDapMiCiOLCVSZbGSnGoDvL91o5ogKB5fhPXbqpDe0ml7xwzx
	Xac0XozqU8aEW6ucVZpw9rgSzZ25YMnaQ4ndrboWnM6G0rQTKBUvMmnyuiqDBtHb
	020BlNMEBldvdLDeU5vYI/Io0BvulxhDSGpJRTfIY9MYA9hauS1YHbB3+Q3jgdnU
	7YSZRKa1SF1wWB8sByWrTkLG6Ty6vHai/M6UWI8fwiE87w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb62far-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 20:29:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso170904085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790195355; x=1790800155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ktq8FOEiqAS2HqdwxrfUyjEpXI5UTr/iZCY9k3s5bK8=;
        b=ZA+DWE+FvZfnVDSSzUvaTnYRlIMTPIDD3xWIjtLbbrEY1xsawN8T6fLmdUh0kgFyua
         ngD/N1pB0SQGX9KmarPXhaiKYIyomI+8imVKDIOxtKX2J3VA3HYq6VHJIlx+ysOvid9X
         fPpUJMRo2YCc3iy6OyfpLTL0+C6IqcnbZyx3hnlEWNfIrk1Frxj/LHftDaQpjx9N1Onr
         iULUpGTblKMhLSMc3wOUvI1G1N2vRJTHXPhDbx4zcx2WN9BDCVgj6zEi6xcSj2xKrdzE
         89R7wv7XHgvTDp9SPV2mzCs4Z5HTbilnPjAe6S9eDSG6zD4+Vb/harBmI2+hEChpUAYu
         ff3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790195355; x=1790800155;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ktq8FOEiqAS2HqdwxrfUyjEpXI5UTr/iZCY9k3s5bK8=;
        b=vZxE7oW79TCzSvKZ6eJukK9iee6uT/dfbW30n1stnehkhYtDjwxxUg879EZfY3UX9y
         p/T1vzMhJmz+5Lltgh2ZE9xQaQXygUEioco8GQD+Nbd+mvyyJlUDgrbU3tiz0zcG4C9f
         7Z5FfldP6jnlgpS6QaQpwNGb16XA8gByBU8cVrmjRAVwURzDqeMzWtZVPgNUA83UZOgc
         gIbRBcbeFEjz+StPI5fP58j5feLf0bDICg6aE3hLU4lygrFAVCb6l9oRjc2kI51RXD6+
         FRDAM7sQBQdeP9q5xd0Au36GtxPPp4HgzT/Dk5ORH/vPRfXdVfCHnUkFDDpRqhSmJkWs
         1IwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGFzRNjqTPoHOOX7mDkhsAS2MOWIY3ZbfGjJC4CLxq1CQqBZU/vi4dOAN/Su7oKYfPbo0H0r4Gvuc5h/et@vger.kernel.org
X-Gm-Message-State: AFuF++l8ryPhilHyuBQP1CuAK6hRmKYf7f8YkNjUltvULAGvqPjNPdPd
	hJYfKVe622GNS4DuVTr3BjbFUyB5vBUPp7VLV/cGOfk7SaKb4YYM/XCn8uH33u/oK7fU90/meqq
	Cx0BToUAZHXfEMctgu78cSv+GffMu5i5cmw2PJrLs2RaINSxUol0PzVrRHt8pCTo/LQCZ
X-Gm-Gg: AYBFou1yXIVqbT9nQwRG5AY/AbPp4jSKiC1IboMwnkdoi+BrCOiKyvsvLeDgfQtXuG5
	x2eJKbFfViXjbnsBAA2bnTUhfb1G4UE6V8nOd5N+OxDa5bVXSe4RF5BDWEtFVRhzQQLDYcCEDM5
	xrcRPf8B7rebnSqVz94r+4BYMqP6y2bUTBaUzLcYiVP7WJA5iZi3EYYvyZaWz7TNXkw5mArOSwn
	0R1WaQlu3K53c1LvgbanFtEZuIsUmSaHL2D4LeojlceFOMUsmUUAjMYYgAyACqBGBUm8JJMitjd
	XaqWBD58sjeWw8oD7KmqlNOtP2P3suIe+iNogOvwyk3xigDaYcB/Xk+Wdyd6cDInKk5yXtAsqb/
	HcxCHv4FlgezdI/SavLF5knac
X-Received: by 2002:a05:620a:4551:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c346fdebfmr51182685a.23.1790195354583;
        Wed, 23 Sep 2026 13:29:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4551:b0:93b:fe5c:e6f with SMTP id af79cd13be357-93c346fdebfmr51175685a.23.1790195353977;
        Wed, 23 Sep 2026 13:29:13 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c64dsm9373457f8f.21.2026.09.23.13.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:29:12 -0700 (PDT)
Date: Wed, 23 Sep 2026 22:29:12 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/5] gpio: tc9563: Add support for the embedded GPIO
 controller
Message-ID: <arQ2mDjqHv4gmoOK@lore-desk>
References: <ea49aa8c-af1d-445d-b15b-25079cdcc72f@riscstar.com>
 <20260923200255.GA1934030@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oI9GUafU7NsbJqGc"
Content-Disposition: inline
In-Reply-To: <20260923200255.GA1934030@bhelgaas>
X-Proofpoint-GUID: 2flPW_zG9rPjLIg-8hsQNKziOKEceoos
X-Proofpoint-ORIG-GUID: 2flPW_zG9rPjLIg-8hsQNKziOKEceoos
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab4369b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=DfaiL6BybcdO9YxK1uMA:9
 a=CjuIK1q_8ugA:10 a=Vvw_FJU3uCUNmsTNrNgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MSBTYWx0ZWRfX7nSpAKiQL7lo
 L3sPfZTVP9JQrIpU3hDLk8vAWzje49RKYZM5ejaV+4R+qoMml+jHBG18lOca1dgmrVNjIiAIM++
 Z4xeDbV9DAadFg6Twy6iyBOwXta1LZo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MSBTYWx0ZWRfX736dcUGDXHXI
 Pv1YUMOQcjhOMfvOGgvjbzca1AxIxZ/OXMJDaYLQ+CaqAaC4t1wDIl03hxn3S/hv3XbzkZhYEEM
 T09r1hEyCa8VBi57BrgEE2icIUAMuam2iAnjPzVl/gBq6oqRV4QAHMeqzyCy3mwbY6/AMDdQtLZ
 xTFwo/tm1Xv6/GBPCX4KiQ5RJOgZBwO0s4oz3P6OlL9iKdH8gGXry3tvXV5azxVNhYPIP1nQOOo
 +nMo+l9HX5qALuxFxQrL+dZEf9t7+uhnFEmFuRbfKF9PNVJwEM267SRsLMOtoeiHKHCq7oDcYqI
 uvUk+ElboJKOEKUEvttdehPAEfCqYLRtUYoGDVpBUf3hOJow0elCWvy8bgAgt4D4SwywUHrPsFm
 iowhJ6D5VEtmE81ojgdfj25KFOzlhSNadnda1bsVdCwhAE0ERM+IeBNiIzsZYZp6w6ZdhN3NFiE
 qxMhyhdRGOoKVFMW6kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230081

--oI9GUafU7NsbJqGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Sep 23, 2026 at 01:59:49PM -0500, Alex Elder wrote:
> > On 9/23/26 1:52 PM, Bjorn Helgaas wrote:
> > > Patch [1/5] and a comment below mention 37 GPIOs, this mentions 35.
> > > Are they supposed to match?  Maybe 35 doesn't include the two reserved
> > > ones?
> >=20
> > They are numbered 0..36, and two of them (20 and 21) are reserved.
>=20
> That's what I suspected.  Any suggestions for rewording this to remove
> the ambiguity?  The current "providing 37 GPIO lines" and "implements
> 35 GPIOs" just raises the question.

what about something like:

"
Add a driver for the GPIO controller embedded in the Toshiba TC9563
PCIe switch (and the Qualcomm QPS615). The device implements 37 GPIOs
using two register banks: three registers control the first 32 GPIOs
and three more control GPIOs 32-36. GPIOs 20 and 21 are reserved while
GPIOs 22-24, 27-28, 31, and 34 are input-only.
"

Regards,
Lorenzo

>=20
> > Of those, 10 (numbers 0-6, 12, 35, and 36) exposed outside the
> > TC9564 chip itself.

--oI9GUafU7NsbJqGc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarQ2mAAKCRA6cBh0uS2t
rD7LAPwKamp8rsgOUtzQVG4FHBs2cTDSeRJAVFRrINYQ0DBrqAD/TBi0DepNYAyJ
IFRIKZYHbaS4VFQf1hshwPrtok5YggY=
=Sv9q
-----END PGP SIGNATURE-----

--oI9GUafU7NsbJqGc--
