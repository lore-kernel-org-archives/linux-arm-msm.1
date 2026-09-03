Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13FB41D23E
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421249; cv=none; b=QE2ujAJOrSAqj5C9OHJ8K50EudYGX7iDudHXgR/1Nx+xr78jx6bEhKu2zjt1ISB2AUINcYcrODOyGBVckTXyYY+SEvQ9f1+mWFYhoTumt/EU3kNjnSgJrfucAhhcTAFJ4owcM92e+MUkpRKsA/oltx3xL9D5NuPUD8YIcQboh6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421249; c=relaxed/simple;
	bh=x7pyjtGGh7b/U1VS+WdJUyI+xIeBGiIvfSijCbKsJ4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZCMzv0ta8D/Z+HodxVbUCjhn9Wuz3G0E9JNBYlcHppop34ECLmVt/zO5Tym0WQ6/BZL1Ywmx2MkhLECbdHnM5kE1DY34FphkxgCWDSGzJvPuYW4g+R+lWL3YDQUbPLhFGhCkOSjOrwNOQrPn6limd9H/VCByYOmd5b833e9iJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnQu6kb0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSYRt9xu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnQu6kb0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSYRt9xu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835mYpJ3178313
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kWXB0DBFbeY92quzkukTnKj6
	Wdb6ho2r4wmQ7PLthC8=; b=cnQu6kb0RChSmq4lxnIYpcqvuhBYGdBZeNIsbKJD
	8oJMC0Q4vj+QYxMxf0y79c6+hhIRHd4EESq76nAr92E8wYIrQUFr9li3/HKoQ7ff
	/NfYJ/goqcQJHondnYMduSg2H9ogh6xDU6h2M1SZ81vDu/+g6Rj+fofMV4GQl818
	e2Pv0naBPSh3DNWjjUrGJ3MeCUdmAG2L4dF0f0q9ohhokzrJs8byw352rbdtYuDY
	OztvUBo8rDG66Jo1gzhgILKDvBguoMB/KX7nIuhuYqyKcMFq0Duaepn+n1ygALnI
	VpxqywGxLlQxN4v9x0bdW8SxF0bokbivs+bfzsdV3ScO3Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4v3s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:40:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so2911547a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421246; x=1789026046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kWXB0DBFbeY92quzkukTnKj6Wdb6ho2r4wmQ7PLthC8=;
        b=gSYRt9xugPYhvAXLjHpAqTxKlJjj8K3Qn1scphZmWAQ59eMVQ7AjYm/ckgJljf1Y9B
         52LrekK+BbUvgofhSIwSnELkshqyDbLeznSUFakCaoJt1NhtZHjEEG2Wsf6lDI2nP4q+
         2mV6djsgbWrvnN+ipgqklleLfIZhpUl9z7APHPryJbGbrugLEGAMBTNhWnUw/DSEZSl4
         WWg/AN2pT8JtL7cjv6Fc/EK6XLoN1Wv8o4Df14jG8PC2bYzeNdto/CdbBWb0beh91lgU
         yk8TWWoHnOeCWiTb4Bb99LQvqWikrz5XwkDMn/Td/7DPMyqDA+XG6TO+MSH9fZeHduBk
         9hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421246; x=1789026046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWXB0DBFbeY92quzkukTnKj6Wdb6ho2r4wmQ7PLthC8=;
        b=DEh4K30yK4fN2E1lz/UpGKsMaFAbDqKI7SgeSnCes38SKbk38Q9b8S21xex3DU1wHW
         AgZC2vYIO9Kh8u+L9pd+1KJx1v4Ek/RjQfCrcOWbr2WnkVDMqGrkTsgVNYXKI5ftdAeU
         qoXppXDjCgUQjpwubXpqJVDKKoTv5Wwwh2E7pkSkKZTr7HkeLWa74ZoRGcA+MWNPRvsQ
         4rK2tkE6ER0YemRL+8OEAeLmz8qhR2Gc+Vsm0Ey5ytx6MdIhqLm8KAl26Q92ig7RrKh+
         2P/KNrpdD1LpJINPqDW7TRSiXqA5rDHMShTM1QqMesBp0A4Ni9QxpAZr2qSjC2NL8Mqt
         nmMw==
X-Forwarded-Encrypted: i=1; AKwUvByqkG/cgUJsX1q6b63hYkg+GMQSVhGshPpH+AyEUKSv26rg+sd6YQGeLB6CLrysU3uA1IEwvHsrE4kkkAQF@vger.kernel.org
X-Gm-Message-State: AFuF++nJLySk1MqDXs4VExKm4K0wFKhZac+qQ9y95LkPsHwo9SdwIoBE
	qs4jWIrPW0U/J2Rk4YW/+U2cs+TJ2ypNAiODd44ge+R7BqJQHwKKG18aJYPTfvBATNSjg0dPQGY
	+a97vShBwl/3Cjdna2CcYd3XaAewt+Fs0iW6ZV4ytzqoS0xVogiF0754Vq25URn4+O2b7
X-Gm-Gg: AYBFou38q1Qhv61ldytjNVIXVtSYm79RnmUF8Gl++56yScokSavx0o1aapaG2O//fas
	XgbQ3Fcq8en9ZnhvLQvsZpds6Oqk0cV1xfO5QZsbJjtyNlnlTcxpM9Jsd03uHWfzOFYPA9aJATK
	Hc27kuDcKesCB8g/whsTO52v4sqifw4neoqU9E5eoYVGcmH7e3GK9g149hRUvk1YIQvVJKqYFuP
	f0oQ4tKyNPzOE6X9rd351y/1bDjYyfltW62w/KJoYq4X/WS9VuDZFmA32eDtZfGg0l3w/2z+Qbb
	6Jjaz7mOqO8HkDwXvnduIzspRjeXiuQhK33A8+X9ZRy74ELBiSKSZ25XHfJX3ficgJ2XMq5mF0P
	dddUeFuEr+fWQN7avd3rCH31q9IQ86SseHbMtjbQe0VQ=
X-Received: by 2002:a17:90b:3c04:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39aedf5571fmr17400862a91.9.1788421245546;
        Thu, 03 Sep 2026 00:40:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3c04:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39aedf5571fmr17400808a91.9.1788421245045;
        Thu, 03 Sep 2026 00:40:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143199692a6sm6767023c88.12.2026.09.03.00.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:40:44 -0700 (PDT)
Date: Thu, 3 Sep 2026 15:40:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
Message-ID: <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
 <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfXyYfzh7kdkxZQ
 jdH4xOH6smh5cHiSs35Li1dvDp1qI6cSvuW4NBn1OgZCIB+ikHbLXIIH0AUV+ee//LfnkwSMpva
 cciJFsOhLI+4o+JZK6OpH/gNPSqU9ANJIy63XbWmJ9eCCypIbkrOREUuR2nuZFWcOfTQJP6q/2R
 imJNu/L6lU/DUrp+TXU50ksOCyMnYJyIZBHYJqjUvaI2JxdkYiNdaZzJTKeCxhSbXBmROZDzUSy
 J8ykmmL0SLLJmY7Ut+J9/LKDpIMN99eTk9f6sR88pz+ZBgRd+WGOY2fs9JeIc2wFC3aPlRw+/Db
 xfU0ujqjrPmdNiKTgSScVMm5Y8BhIv9Hneubm61qb1xddNIxIVsoi4ctkhCRePXATYg+XBP/fWu
 AlxRRrrRheb5rfbXpqm4LnMcQFK4vdVZqNWPC8ttpvfAkB+9xs+dk4xqLqPA4pKAfV8Y4qzZOGd
 reAeJJCoXmhuFEzkj3A==
X-Proofpoint-ORIG-GUID: 3Xc_CoSV_ug8yMuFwaDt4gi82s0notCt
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a99247e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ibTjlFuhWse9lpBZ6vsA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 3Xc_CoSV_ug8yMuFwaDt4gi82s0notCt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX5FImf+G59ISn
 gWnzURzVN9dct+74u5jDDokp5FNUqdBr0qUnWNlGv3dBMU3o1z/SSrP7mNuZgRnJUtSdCQaoRwN
 u/eaF/CuF05Sl7dwiZAJhRbOLEX3jIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030067

On Wed, Sep 02, 2026 at 04:00:52PM +0200, Konrad Dybcio wrote:
> On 8/31/26 5:21 AM, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add the initial device tree for the Nord Ride Embedded board, the
> > non-SCMI variant of the SA8797P automotive Ride board.
> 
> [...]
> 
> > +		vreg_l7a_1p2: ldo7 {
> > +			regulator-name = "vreg_l7a_1p2";
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-always-on;
> > +			regulator-boot-on;
> 
> You mark _a lot_ of regulators as always- and boot-on - is that
> necessary for all of them?

Ah, sorry! You already had the comment on nord-rrd.dts. I forgot to apply
it on nord-ride-embedded.dts. Will fix.

> 
> [...]
> 
> > +	/* PMIC H - "UPMH" satellite (CD90-73961-1) - SID 0x7, Bus E0 */
> 
> leftover?

Since we agreed that a bit comment is useful [1], I guess you are saying
the "satellite (CD90-73961-1)" part shouldn't be there. I will get the
comment aligned with nord-rrd.dts.

> 
> [...]
> 
> > +	/* PMIC I - "UPMI" satellite (CD90-73961-1) - SID 0x8, Bus E0 */
> 
> likewise, a couple times
> 
> [...]
> 
> > +		vreg_s2i_gfx0: smps2 {
> > +			regulator-name = "vreg_s2i_gfx0";
> > +			regulator-min-microvolt = <300000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s7i_mm: smps7 {
> > +			regulator-name = "vreg_s7i_mm";
> > +			regulator-min-microvolt = <300000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> 
> Are these actually exposed as regulators and not RPMHPDs?

Great catch, Konrad! These are rpmhpd-managed resources and shouldn't be
here. I will drop them.

Shawn

[1] https://lore.kernel.org/all/b522c9b4-4944-4fb2-94f9-bd2553690901@oss.qualcomm.com/
