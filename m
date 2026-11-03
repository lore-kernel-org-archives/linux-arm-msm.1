Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694117;
	b=Gbh8bIRxBVjhYJHBXT1Oz2F6gy4Z/+6C+gxQpedoAIxC091/P1RFY5tNzPL25nxyoPe7
	 D2kjp88C5cAjSghCuJ6ihoGfrYoWBY8qZl6STOXi6QirAnNSNYqu+i/CFoke3UJv4u5zA
	 W/ao3Fyaj7SqohVNxibIF61RB9acoavQtoWUrP0pBxQ4dr6VUEjg2jKEK3XmVsDylWouX
	 PvwI6q0caWsas3BIIN7FNbzwQ+y261+sJTZvgYZYYpPrRCsWKT/phb6GIifAskNjhiZTY
	 DfmBCPIu8TDbvw9W5UDLiKrHpAYxg1luNa1I5Ec0PXYSPWn4Phrdtwem/QfsHjRWntg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yLQRnh2hdGlVukDi2GeDt7GCNY8T/kIpvofHSqWsHiQ=;
	b=SBziM4JZhPGvhU+J216PF6z3Uog/wtMNjkBJlYBH6jY8zSvQlKS8p4yWdVOjCqdjUrmH
	 oPkFeQ45L0rPteH0yhbBYsrMZl4hw5R/s7NhIAiObLK72uWgPKIqX7E5/EY1JpAyclsZf
	 +Box9I9wDV9+qVQoW+UVzXXaf5LjZRZElkYxEcDBtVGqhrAS/0Q5MFj0F1f3fifhVi9Iu
	 PyhePYn1nCnX51Y+P4r5hNuFar8Vt8ahG8oGIlE7Y317BmlASHgGJ0IbFcFn1Pkf05Pdg
	 oYa6ZrHT7P5r2Yd+3CZuH43j8CsSL4+r+ZzE4r9ulJVerzHTVHvjsVOxsBWVXv/vRLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJVYUhix;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXrDHLwD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02957606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 08:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02957606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJVYUhix;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXrDHLwD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37prVg1397349
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 08:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yLQRnh2hdGlVukDi2GeDt7GC
	NY8T/kIpvofHSqWsHiQ=; b=jJVYUhixx967j2ttO4X3I1RY5j/nnJieQ6eYyvH+
	ALvOFWymp1Kw/xWtKRwb7JxUPkj7PvOvj2qZREyi+DjSkmsJeuMQF0Dv4/F5J58f
	9T+gr26qtTUpbxxnPBVBOpSbIgbL2FYQBCNURplYoa1Vtk3ZIO/7uduE7KdpWtva
	NJNm5u0Y0OOFdd516ZiyEeZ6RYRH74wcgbvw2u0kQIxX2Ge4bI+lKZWSjgB5v9b1
	kdwGRLjPWoqFOBmhqlhVJkkxH/r0ViNspS+C1qsVtQGj+u8X9ysgPPVD3ADSFFyZ
	RMcdtCgKeDpw4tIS5ZIgq//qs321DTAk6Vilp1UZuID/JQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5hn8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 08:21:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so6099100eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 00:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793694116; x=1794298916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLQRnh2hdGlVukDi2GeDt7GCNY8T/kIpvofHSqWsHiQ=;
        b=gXrDHLwDcGr0jy2IYdwHzxamMMw05I5eI4UuC3X49SUi8JnTolpNAUfXAcoVx0Ob7O
         9qkEr8a7cCgWp9BVTOpfRrq5KcdVIRMik2zmSt6tXRS2yL2isX7euSmGWOcuGPUOPhEh
         2WzVHkZ4pYar8OJuB/medfHpHKsZj5yoKs5geLqIkfSdzmSX4YUS2AlKsyOqf3NKhcwB
         2LqYZ9OFq5tEe83a4LDRz/AJ24Tj9OtKo92TiftbCX2rVRHqL8uxN4cnW4KHJ5+DZZ15
         7rNIe9vKQaIcW4H4cCvbhxkXLlBV/eiFRHrmo5yLUyWiSr43fCPf6cnOPAW/R7shTktr
         NmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694116; x=1794298916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLQRnh2hdGlVukDi2GeDt7GCNY8T/kIpvofHSqWsHiQ=;
        b=Agwzs0oVIUNFHg7xwG/LjVr6d8RM96GYA4HPdDD2bKr46YWLVvxsdhxDAfV9T7vJBD
         OpB/Sq4Kdu0SGbdSULc8bmoo07cFt1W0JHAz7ezLVgLuqCO7Lxw0/x7UddxV7top/1AN
         DTV6vMiogDiwwdrl5MotNY0CEnqIvxloiL8a3UafixzHS7mG59mFlXSFVlZnEzo7/LUX
         sEGMKeXqJqwGV8W30WpJSo15EBFn+acjdiSwnTBJvFgVTZczq3imUG3Z1IgxmfrQlP6v
         Fy739JYn21h+4EJHORtPkC1iPZXSgd6guGHeXd/z+ZT6qATMihAfSHQKGKt4pLt5ngQz
         f6/w==
X-Forwarded-Encrypted: i=1; AKwUvBy6FBlwB893Gwz3otsbX2yF0C87RHXaIiXxDoj6KbA3yDbih6g+l46MxhXuTMwS4DpiI7lHIeL37wNn96n3@vger.kernel.org
X-Gm-Message-State: APuU4Z/m/gHCivwGJdht/a32IJJ9BEnZfDU5n1jCsrzkEBiDZoZGI38Z
	M1/KpRKygOrR/ZKD+Q3ePmyctlceeVUFrPHpodbwcqT5vcF2VHVCUTAJN+Hyi4jlTRTqotiXq1w
	5/fdHo2VfFTWzKy8Se69L+11fp0b7enzC0mBp6+x7LjpdD1/qHrKe7X0TYWdkxtHMvZq7
X-Gm-Gg: AYBFou2h6pXMqHDTD4z2UnQtXFGygJqdIRms6Fd9raudbHwcWEmjYRdGKFCKdJKsxcH
	riN2U3BFqtfD3HgfYJm46P/8Lmv4Tv+upNAdxQS03s/z8z1rAqcvFPDY5x3RpTNSebzZhCC5igo
	JWZjq71l+Xb5La8yni+ii9nuCmuWyOLLSvn2A+Wwge+LlUedfT7HLyauylQnmxLENxrTtOsFoWP
	B5kt7H702DuGnaO++EA4+c2WeSTUHVH6L3iFG+5HSf+5XImSR5aBgGsj4t2ER/4jqOhZ5K86Zw4
	tj19O57om6wq6RheXjjkQwacV0YNty+OhuiPInnrK3ZHTf2EkIksCYCDxJQNF/VnubdmU4VoYSd
	uPewKFbKxxhpYyhoBld/5Yibfq5OtKPSCGgSyUksbHpSDg9Z5H2fQMSM0OhmnQSsA+dfzn+Rydq
	AIABTfaevn37b77Q==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr20200300eec.29.1793694115498;
        Tue, 03 Nov 2026 00:21:55 -0800 (PST)
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr20200273eec.29.1793694114999;
        Tue, 03 Nov 2026 00:21:54 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm39999277eec.10.2026.11.03.00.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:21:54 -0800 (PST)
Date: Tue, 3 Nov 2026 16:21:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <aumZncr_X52nXO_P@QCOM-aGQu4IUr3Y>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
 <34479df5-3f4f-485e-8204-3744a09ce08d@oss.qualcomm.com>
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
In-Reply-To: <34479df5-3f4f-485e-8204-3744a09ce08d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wUck17yvBpljzkGGcH44HCwQgquy36-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX5RsBSCg5ps8R
 QsWCAr62x3Q6jmif+dLRkEEHuXkixn5kolGhl9nv8bao9NZOm1M6VfJLVADn9dWrU+6u3bOjVL1
 jMydwvFzNq+FGQ3gkMjI0AqGBbOHJm/rmu0F6N22zxB+5LGjANy/0OI2mSQKqHfEEe0tHj6FbsQ
 MfzNWX6d4uA6XWg2yzZHeu9HBExJpHdUMyb0ihHgRbOxWEQhjmkFd4g4xLIHUDiDy3atfzaSY/X
 FMEyEId8wnB6ZBg62YsBtM7KflLGV854gRMQYxAzKFyOE8j6FAfFCcrlPEDfmIDZHThlNLqCBWb
 7xvX8WWrLcKmpJPb+Mqx8PnnbaGJio/eGfhT3TinxTHw18Zq18PGkl/NUhonhg9TyzwLDIgEuHP
 /S4Ufh+Q5lMqZkCVBG2ldTap9Pl6lhEc6UmYVu5Mvx43lv58HOYBqzjgXGVx/2cuXdtwTGhQXfe
 UgxT3S1m+DGQZGrjv4Q==
X-Proofpoint-GUID: wUck17yvBpljzkGGcH44HCwQgquy36-7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX0J2k3Ji42P+3
 12tj2ClpWjHurBdRK3+W8n1dtmqfWtjUQ26yX+sj2petc4TD66ZSxaoaB3lrpa4ngFpW66LtcWS
 pUxPAGfVoPH2AybYpc/eTgrZOgwiyyM=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae999a4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JDAaRAOIzmlwRyo0OuIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030033

On Mon, Nov 02, 2026 at 12:54:37PM +0100, Konrad Dybcio wrote:
> On 10/28/26 4:01 PM, Shawn Guo wrote:
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
> 
> These thermistors seem to concern board-side thermistors, not
> channels coming straight from the PMIC, so these additional
> thermistors belong in the board DT

Indeed! The AMUX wiring is board specific. I will send v2 to keep only
#thermal-sensor-cells in pmau0102-nord.dtsi (for all Kai ADC instances,
as it is a PMIC capability), and move the thermistor channels and thermal
zones into the board DTS.

Thanks for the review, Konrad!

Shawn
