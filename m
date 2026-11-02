Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586885;
	b=jd1KedRg2jEuT2Tw277KTDKgMM86mQ7KfjORTJUP//TpIGgdIUEvYZo1N06jDlmXeykx
	 8L6UY0jZj9tEQILZXEwTRX59R8TprmftDt6c+9o7TrUdUxNfa70m9jdWAuk7htYB5uBtu
	 aV40gki/yR+qbCbAOG1hqPODrUhu4A5jvNVJJ42tI3WtKgt/U6EQyQEQxDuuVOJZ+X3+D
	 14wmWBm958/8x+jsDvjeXIhcJJskUijS8oHvdhpRY8n8dmo999tBhLCXmavTOr17MWvSx
	 AuTROABvxRR4ifwGn2CsMmywfdIEcXfMtewp5hgNz+2usXN2c1vTzNhjMf5pt034ccg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pTNhaZslzEJDcamLWWGIWWaXhbibgaPik5sia++AYaI=;
	b=NX8pKx+62J+SCa94f0+k8GdzTgL4BAJOGFZRsP7PvjeL/WMDLbZ8b1sZ1nSj9rP3lHvR
	 S5zyuvLrq8K1Sl+4eP4FcE23+Ezo/6PiM3IgrBTL5y49ERH4oLGYN1a/e6fFhsc3vAovu
	 Knx4jbE6E7j+ibr4IATy81Z1lJxG7FdVTn3+Z1hK8ZVtK2IuVyu4f8Hl/T/1FPWnxn6sN
	 fM3kf5ToYkzESPn3ONBI4KvK0TVChGJetbQ3BA3AUSOpCbRmTMsCZfHZkQ/kpnzZC3AFP
	 yk+0OCgnqSOFXhGPqbtPbs7VOlA6wa7ZStCEhiRX8dYE+l+aKOuI3lX32HGp6Y/yhkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="p88/p0yH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNftdOWM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E2C606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 02:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E2C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p88/p0yH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNftdOWM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20KPtR2864628
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 02:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pTNhaZslzEJDcamLWWGIWWaX
	hbibgaPik5sia++AYaI=; b=p88/p0yH/19nh878ew75k6VOBTAqMWiYwmjwMTWW
	JSKLLR/ZTr55p40J8FBULNc7ZVavSZOeA2RG133M5X9F6L4mC6rpZCKyxfrsMPo+
	gwE1OKaLXrwyHNrDNze8uCb8hRYk1dCwrqCeWTK/ntarEZr3FGFS8JybYxhw2NGC
	7KRDnc1Zin7l48Oyrq6uOCFkJC0Ge84XMcNPf0j613AALd8Ct577pAB0wfeiUG9H
	95MxXeX35+1+JvjT2O+vaEpLzSHMJoKokkaY80pdbknP+6OFAmGc2c9uCDavn2Q6
	KUSBft9X6N2xPTeMvbvnwE1HZ2P0ScOElt12vUf/jtLyuA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6mxj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:34:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso5579852eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 18:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793586882; x=1794191682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTNhaZslzEJDcamLWWGIWWaXhbibgaPik5sia++AYaI=;
        b=TNftdOWMFA9ulB2ibvL2rljbJZu5u3b9Gz4dME7VgVkzw6NGWja4PVyhwNpz5xfY+Q
         WOeK+Cx3gxWXGFdH2gsFXyYjEK9gNSGNMhfKfwYYXbfg1CaeEbO7bhlvTtxvmHlvvUxd
         ZrSugbIHUY5It6MmHluV1NSww/KMUJtOY6GXnV8WEAWfhidqAgDsgISd+H7xbGtyJGK0
         9oq7sjAms64w0iPWxtp/rI15gqMg5V8u3JznhZ/WZaHvTT1eypkfHx/sAqQrDWQ4xt01
         RHG5GUhgIYfv6r81hbHcr8NAOleP96zjfmxv75KKYAoEO8X8FklNb30LYJl6Hrf5scB2
         v9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586882; x=1794191682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTNhaZslzEJDcamLWWGIWWaXhbibgaPik5sia++AYaI=;
        b=I817r367l7U3Rf9prnpHOwOdiu12jkXXo6ZCdHcHzrA/OELtj6MGNULP9B1kypORex
         8hiEooLLUOFmJcKkmZA062T2l5S7zp2ES/fpx1Evjq/sSgyyxiFrj6tsVUg9nkxXRUFK
         oybAyTbKuCECOL6NrtBlnT+wv4Vq86WspBbGruCOmeV5qlZdIgy6BK8geKrAfn13GM5L
         9Vf8JHBY2K5PnHsO1TjhtWAzw4ihvgSSh8vmkK8DhaGPgqYX7det1n/9bcNRriEKXqwp
         nqikM17MfFP2vMl4kDeBYnlC+AmvBaO0D79W2YppSJjdyMrRxMCV+OS5ZJkDvV5P638G
         VchQ==
X-Forwarded-Encrypted: i=1; AKwUvByOKrvjMmDIUiywDHPbksyLEohJsCePPWKmX7O9QOHtnMegel4B8U3wNnvNKusAJckw4OwTLc1d0htNYf/4@vger.kernel.org
X-Gm-Message-State: AFq9FYIw4IBylqYWVirEkLThCVdrNW9UNOR0snWCy0fA/sQFYr7x4S2S
	R2mTjPq/+3dYBT+n6aPXJsM8A7etkQN9u3eHxs0WEnTmU5ddH0OgtUP/pNj5epamMc+H4XqjpG9
	Rz17m+am10jigpVFrW5eq3PX18Ji8t1NW5zJh4FHlJ2YQKxXfocS17EhWQGTPfcOW8i49
X-Gm-Gg: AYBFou2uNpwCQnoeIKbaeX00RPiN29bPtAdI1LsHDHU4TvCua2x9Umhf+dUrh3uXSbr
	Rjk5NYJPDAZlfDeUXZGDaiu/qPtGgeu4kIzlGr6ons6pBdFIaBBLnmy2bhtDft67XmhQO7ZlXH+
	iKwrcIgG2KglZJWs2ZYX4rs39PBtjY87DW++RRE5aXpiM3fB6pGSGSxDAAC+4JcVrWQgS1pxski
	ghQiVpxM3+rleCDbHSAsWdJVTWDLkX7g+QRVPySkbuEYNtQl9r/LouoUl5NvGhR398o4i0imIEl
	iAJF6YoDYVh5sGOwFIOejp+whJOMLwMbPLtIDrto5QXWL1gdre2nV+NCZefWt8V+dS7qbuSuDz2
	mUH05sj3uCLGkMzRksFWtmOxLn27lNy7aMZHU6UpWM8vs1WKyeJI0yQgiElJpdAVezN7XSlRbua
	gpHXVDVDRqo+gXEw==
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr13780695c88.11.1793586882324;
        Sun, 01 Nov 2026 18:34:42 -0800 (PST)
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr13780655c88.11.1793586881735;
        Sun, 01 Nov 2026 18:34:41 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm28674816c88.14.2026.11.01.18.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:34:41 -0800 (PST)
Date: Mon, 2 Nov 2026 10:34:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <auf2vF7MRgWDCk93@QCOM-aGQu4IUr3Y>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
 <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
X-Proofpoint-ORIG-GUID: jTyDIan4Qiza3hdE25qkH3sK1i3Kh3Ne
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae7f6c3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qMigHBYzDqo8UOFGUZcA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: jTyDIan4Qiza3hdE25qkH3sK1i3Kh3Ne
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX8EIjAwIqfDxR
 jY/8/tTx9aYJ2CZSDigzjJ9YEUOObUn/w/w8bYqLaRf7gzA5GrQWHpQyYaSMK1H52yNqm8ssi4e
 hKMXK5UcKuD47V9BLf+nQ9z1G4Eq56U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX32fInMy+CcBe
 MouUBu4l1K9uU6SmnC8+0KU+jrYkpqrQPhc0GiA4ICHeEBxYRiUcV1rmwsmpLxoWU34aZEDndkT
 Fj1wFgOmZC/cnvMbpfqpchf/fNVIbZyRhc1M2drxecxUHMCFtryEwezjUQkDMmCUuN+Aihgegkl
 lDpamDEwcfeRZrSGICtFMR4/5wWqUfPf7UEyDSuqYepN3PATF2lZy/aCVr7sLASgBq/u1BQ2ndE
 peVczheNiiwGaQA0w6WpRlga6JghZnDsuBCYymo4NH9Vfdb/nBqIOoOjIkJoRd5b8CmEDiu78n8
 B0TSGFIQNfDKM+mvbZKn2zs5NvzFoQeoBazfaWcb5gyvvvg88OWY1cb2LWsxiSW/mg0qFS0C/zZ
 A+XmX3hiX6zIYpUN82qaVLNNMScOSV8SI80GijeX9h7IY2qGwTmCOy+BInGhfELembQQcmFLesp
 01+Qn6UlBj6qv2jn1lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020009

On Fri, Oct 30, 2026 at 10:28:21AM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2026 at 11:01:03PM +0800, Shawn Guo wrote:
> > From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > 
> > PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> > expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> > AMUX thermistor pins are wired up, so none of the board thermistor
> > rails feed the thermal framework.
> > 
> > Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> > Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> > instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> > pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> > thermistors, so add only these 3 channels.
> > 
> > Add #thermal-sensor-cells = <1> to the two Kai adc@ nodes that gain
> > a channel, the new AMUX1[/AMUX2]_THM channel(s) with qcom,adc-tm,
> > and a per-channel thermal-zone for each, following the existing
> > Gen3/Gen4 board pattern of a direct thermal-sensors phandle into the
> > ADC channel.
> > 
> > Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> ...
> 
> > +
> >  		pmau0102_f_thermal: pmau0102-f-thermal {
> >  			polling-delay-passive = <100>;
> >  			thermal-sensors = <&pmau0102_f_mbg_temp>;
> > @@ -501,6 +545,42 @@ trip0 {
> >  			};
> >  		};
> >  
> > +		pmau0102_i_sdram1_thermal: pm-i-sdram1-thermal {
> 
> Existing thermal zone nodes use the "pmau0102" prefix.

Indeed! I will update to to be consistent.

> With that:
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks Bartosz!

Shawn
