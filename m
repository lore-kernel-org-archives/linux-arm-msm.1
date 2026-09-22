Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8374C2252
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057867; cv=none; b=CSdlqzg05FD3rm6Tegso8kim5yRIYWIlfaxSf/Sow4IOnm5WXFW1R9599xut7mTc+SmFboTwXfiJ+XANP3pwA/LxGyFuOMkcYvMnOA6AsMv2yg1czLPSOd/hIZfnw/kfZ6MX5aMT5Bz8DSVm4WrPGY2yjvfOavuWRLyZ9eIQuk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057867; c=relaxed/simple;
	bh=k8MmBGqlD6vtzuFFuLfgaTpxSsHu0xPgmRnpcwvoEpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvjhuOhRhQlgIFNSqwawiyOAq9nLDl6PMG5tm3otlvKg3IStRj3siOuCTXpYoeFQHlnFEbpG8zWCL6PNV6K0aU3X0XbywZbgSuCwLBI25DjNKRg4xfEhBb1ws4ncVj5m6TV+ci7EUUIpVXSTtr7Xm6IiYHnAJhxImH/S7lcENKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnBDRBIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUQtU3Gi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GnBDRBIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUQtU3Gi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4Ma9H3382626
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WWkl2gI4Dl651xy5p+ZRq11f
	rqsemeLyAmJ3wzayKPw=; b=GnBDRBIwRxwG2hKdfSdL1C+/oagrSMerIR6B3ast
	gFSZ/l8MaIiWqwgNwE/LPLZ0gkTGMtbMpyY3ICt+6LZQniNcJSGquYjnW9/FWXu5
	A6mBhexJb7PnHOPLt3Wf5WtvGbB5sGwhXtlCwLUimuppaQaUmqkAxFA0Rx/vjeQX
	N9GmrL0AvaX6roiraAWk+qzahYA5CDxHf+6w6fGN3poa/IOhSiqmqKAHISoZeQ0D
	7XPAA48EvlTtyLZ7qciYsvJ8NbLgiD9/CUo07DIr+L1LK/5mueVsJTaQxVa52Ec7
	evFXgRB3NUeag3riS3J/fqYsa7SCplCPT1TPplD3b5isQw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8bug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:17:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4999833a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 23:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057864; x=1790662664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=;
        b=LUQtU3GiqLcfyHglIhmhUHrcWQ+5ByuIW/7V3EZVZpX/IQjnZuLWiEYgKrZX1OeOfe
         lHOn7+Lkj9QYcujLJ2ZWL/w6k31bOSRpmYkJr7zTGONSIvojCqlsVHkbAJjGlifkQMge
         6JiVohTeX44+jnE8BfJiwP7HVY24xFSGlWcXo3b9cPzKhWnSzt1qZJegqmFPP/SPgZkP
         FxqRjRz90bofbTUZBuLg5YQCdsac8uPI9tqpEEnJA9ySnjIq1O8Xrf0nzjqTp/18TXGr
         rnTVbS+QeHrX2iCWtIRlMh7buwaFzyk70ub1PfAxNb0aJ6fx8CtwrnwOniiTb3BbGtcR
         7VsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057864; x=1790662664;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=;
        b=S91FDYeeRlZWDTQV7JMkgecTdcmcxcEk8iexVVc9HyGHUbS+djglXXeLdddUoR7iKX
         PFzarV2Szgz0lEaEFtv8YiyZ0vL9ZIbVgHoS29kiT0rNN++9IkiXWTsqQR+fnxrS6YQe
         MsWmtVU1DDFLTJTTIxZcnm3veV/NaRvaIZCVbg2RGdNF9t0ktnJjdfLQLWzKgxBF9ZZm
         rH9a6vID7+ln6wPG7xOjLMawMW14CaFkq98rVki5H1nxY+IedAIlfq2vB1etbHbGHFDr
         ygy/EA+bXlRNYUuuAKtXmXvMk43/s8mUOCrDHDvVDXjgnVBntqKc3CIyKw3LBxoy8MVR
         +7dg==
X-Forwarded-Encrypted: i=1; AKwUvBzzaMwqzJh7Oty2bzGbR2fjdGq1m7QuxY7n1NHVBEzPZhvnzzxgpdk5U0DQBo+uN/dKsjJPjtxdWQnIxUA2@vger.kernel.org
X-Gm-Message-State: AFuF++kKgs/EMmPFWaPYUI6cl0nXBVrMM4HRlQmRa4OivtakL9oNwuQP
	kBN+sE32fFLnq7bl+3Izj1O7ZvI9pvIB7SA/FexkpusjfNRgNGw7Wd4TH9GcqU56+i/4ORCOubI
	J9rrRpg+XWnDjnsxL1Uh58wzt+M1b8UnytL/HVcCEdJZx5texEi8ixnCIFwHAdt0HthQ4
X-Gm-Gg: AYBFou0HN4ZadjbgeSUkOAYrS0FxiOp5owKZ6OgNAsH7KCIptS4gNsDNIlkhvcWNQE9
	KbE3EeiZW/miZq5199GE8/S0OC/FSIMLTJbCdjXuttLdG2v1owF2GN9YZeC5Ek3cnIEskNh7Gwg
	3M5cclA/NnDFIkXp9uwOyLgDhS5MCHtcz7EMtnlL8/pn/T0hU41jAgi7u9PG1P2FH82kSq/5OHG
	kwjByed6y05ww99nWTM7WG4EbsOp8iOe0i6kp88BFRHcgoNJwXGSHl31dPy8QgycN/lKuZJkwcy
	c0dXrFKBzoPuCsW2eJNGsz721wk4FhTAQAzZH8q1ECM9ROXMn3k7xPymqqoMb+OB6ul2hYRH2+9
	sxbVWwadF8kvHeXd2sGWHLdYhiDkbOaK6Qqw=
X-Received: by 2002:a17:903:3b86:b0:2dd:c100:a5e9 with SMTP id d9443c01a7336-2df60b7ab72mr1331755ad.61.1790057863724;
        Mon, 21 Sep 2026 23:17:43 -0700 (PDT)
X-Received: by 2002:a17:903:3b86:b0:2dd:c100:a5e9 with SMTP id d9443c01a7336-2df60b7ab72mr1331645ad.61.1790057863321;
        Mon, 21 Sep 2026 23:17:43 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e786dsm2974252eec.1.2026.09.21.23.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:17:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:47:35 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <arIdf+RFybbdI4ki@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
 <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
X-Proofpoint-GUID: K5S1QcKvLuBpibDkHJWwE28j1Lw3kL-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXwHMQ1bPfrSt9
 Z0uWqV5/z8NUynVp++p2sBYsNlsz+vsIwvgL1lwWTEpmS+mS8Amn0pavWoAzklopZXVLX0XlOAr
 41vLkM4kz9xhamy5zEZkajhaD7/FACKupKv9INrsQOXC101Vugr/Vs4RPF/HrtJVGyGwstyni0E
 HwyR3qihI0V/qN63U9c0p4LzvnTTGaQM2m6zAiqz16o6rnTQNVS0+pWGAbUUZH/xOHC0jB/eiTn
 L/G9NmNRBWfM2gNKQAMtRdgXYauDlbKVFPzLkazo1CYV3heGR/8nkWAcYA3pzFTWTpo+KznNHXA
 mrOVaGBVCGGmch/DVlyvAgvQ6v7AM4RILQZBDOYyZ+LI3f0yvZ+ZFEEPcayk0nSudleqrYyE1vj
 SYgTbPN9AV8wGX80tiyKjWlQBRVHQc3AQRq3CeRecxqRRELhuUmGcSHE7t6ye1tiXJbR0r0ApQ1
 leB7bc+l+qzFdgomQvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfX66CuIqP9n0WV
 ZJoC2Hk03SwknbUxpZKyBCGAtxdCi7DnOT2MBqhFEZQWqXTOXzmV1FPoxPPpUH5YS2B9e6Flrzv
 M66mJUGDehDgCsNe0gwxljUYlEXvewQ=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab21d88 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=x-C9AHaFmKqvuEDWSewA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: K5S1QcKvLuBpibDkHJWwE28j1Lw3kL-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220088

On Wed, Sep 09, 2026 at 04:51:01PM +0200, Konrad Dybcio wrote:
> On 9/7/26 8:33 AM, Shashank Maurya wrote:
> > Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> > Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> > I2C8.
> > 
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	reg_dsi_touch: regulator-touch {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "rpi-touch";
> > +		regulator-min-microvolt = <5500000>;
> > +		regulator-max-microvolt = <5500000>;
> > +		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> 
> Does this need to be always-on? There's clearly a consumer for it
> 
> Konrad

No, I'll remove regulator-always-on in next revision.
