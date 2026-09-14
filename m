Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA153AD52F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371679; cv=none; b=rRWdzMyJwavlwRO7d3Wg4huJ8Ws4/qyLeFExrs9A0B3j+85dFfFfPGIz7dpCTkmNWIl69ZSwjFbTWQ3s5F69B0ropbbH+M9TFW7km7yrck1YrtW+CZ/RsyV4xZpvrL+s3Qvlp177BmYy9WZwJOd55b8l7ZCCcB7nMGz5MoLxewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371679; c=relaxed/simple;
	bh=S9mfOgZNT37L0iqPCwnRCuYwvCwRk1c/oJFJz7QOEUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pk9Mky6V0Q+w7IaFF66rrEt4SNVJwKZJkx3q0i6FTHTO7gN3VZWQKL2X7HeKp87qNHF7pvDnj8ZMD5KJCaEJaEGIvGOH6bITt/c440lSolkkCoGKInXO5r6kWgxmy3LkyD8664Hin7yTFtLDgHCCVse0v1ne4627GBtexsnP+50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgGDswqZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXcnIoQg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgGDswqZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXcnIoQg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5is6T3196659
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P0lROkR063X41Wk2R6NFEfyL
	4RNeusxNUrV+Xwt9Mdg=; b=EgGDswqZ01SYxWNR+unnXQnYUUxw1HoMQy1J1hdT
	gGQc6chsMB7BhEOiZdqazN/B5lirvHoe7nEd3LEMF9F7o9lmMsHt2mcaDH7zZLyQ
	7bVr85TynDmEef8xY1Nl420++rYG/hrrpmg3oNSiZGZBv248QNhQYEHwxDqJW37m
	mQetrFUyGozl83pN2LppyefvslKcofAJBqVu7P7CgnUs7AAaZgKFqc9RQidDRv1o
	p1YAWNi3FjsssgKNcOBNjQd/SKenoGwUS9M+fGhxicxIsaZqG1MubCYLr1+APu6w
	Vq0OnhAih9BnTwfhsKOP31heO7GVc0K6SzXtySAT4VcwLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdhub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso716353985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371676; x=1789976476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0lROkR063X41Wk2R6NFEfyL4RNeusxNUrV+Xwt9Mdg=;
        b=CXcnIoQgiuPr3qvn4DB8aNhYv32nGxJWnIx3u3GAUY7dD3w81LJQ3nL7QPkUgG0EkG
         AyJ71Ye4b2I52oPgObzo7zQ7Et27jkqCtncAkeQv1U7HmyLvDzxVlYqxHPKCnzKUdaZK
         rIs89MSD3eu3t1TJ84jWyZGHfRjVM282RcS6H2HxQhdGBFgrQc79tNvIhudbddeRE9rf
         XSLjUWBLX3It6AFwddyCLhXFK2Fi4ihj9zGVZlnla1s6Y7bRKBH7W9FX1ip5cuYQDrPt
         sVCqNdoE75tCAGNNIlVcQB5SmooNkF6fUghCK11N49EdO21wT3HEpG85fXFojwvtBWnW
         jyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371676; x=1789976476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0lROkR063X41Wk2R6NFEfyL4RNeusxNUrV+Xwt9Mdg=;
        b=rU3AsdQjub11ntugvyxB08Elh8Tq/Qc7q+aU2Jhn9vZEcgIF7yDj1knta8S3KXuvm7
         GnhVRSdwF4Rwcx33zCMPKVhx6Vn6/LVqN4bt/jqBo827Zdq0pkadRlBgHiw7nT241jEO
         zaakdOGnvgtJDhzfQhtxBFFJiEBvZt9GyOtQH6YXkQhPWBHx57yvgHzi7fjMH+yrBcnj
         mPEId9U9dDOVw0aI+uJbhpnuVxkhaGWWbk/etsb9f0PGf8N+FrzNaTyVJcCVUghrvHtA
         77NMosqlsODts2WmO0QViwQ6RixWVzdsZzVRQvtRPNYDbOGwt61et9q/jP8mEaxuBHYQ
         zcYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXeFIVFElIUVNTqZc9F87v6YrNB5W/3kbFm82rIzxGdl3UR7M2fMhEj7shb5DaEMHw3PLKxEhmLRS8+lZY@vger.kernel.org
X-Gm-Message-State: AFuF++nImxO0kXnT0K7M1Kw6aNI4CMIQZ76RFnnbr5nIiVY4EjAv36jV
	czEJJOV0quisc5cNIiYH4w4fepr/8en3NVX3Np2+CLzejwJsBUEwOVU1TSyWseLYKqA+K4YKFl3
	inR6sj11vc8snplRQMjWOuzbrhzmPPRLmQ7FRHkCIb37xWJ4BX7pN0CjqtoaJJ45FGjEG
X-Gm-Gg: AYBFou3xiNlAPZ2O3HaV80HFmh13rhkqZ3yVsuEehIq+ttqBSwNO7MXGMBBnxHWElyL
	iOGYZjQGD1BDuuLP+dQ05BpyTatgcCukQbocIkjQsaj0TTk3QsHAT3FD3hOenW/i2B+UR8GAJhV
	ZFyRcekeqx6wxkHMMJYWtVn+0OxOpxGpoa/tUe8MYbZ/5cRun8m5LC7f7x0P357gGe9cWlEZsDx
	BtgioebqT69fAH9y7OiCEyTI9E+kstk67OLIaVDFc+6NuuAYEBd2Ns43aWRaCnib+ARUP4ERMW5
	0u5QFLGl98UWpoXSFyS00dRBiqRrf9L9lHLbzVEQKbccsKActNgxdF3VKfaU56od2a1sId03X1E
	ry9xZh+I8sc5cYw==
X-Received: by 2002:a05:620a:44d3:b0:939:6516:7128 with SMTP id af79cd13be357-93a2973a233mr211314785a.3.1789371675625;
        Mon, 14 Sep 2026 00:41:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:939:6516:7128 with SMTP id af79cd13be357-93a2973a233mr211312185a.3.1789371675134;
        Mon, 14 Sep 2026 00:41:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm24916609f8f.20.2026.09.14.00.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:14 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 20/31] arm64: dts: qcom: agatti: Add domain idle state
 names
Message-ID: <n2ddnwkp7lm7m4b2qdcspuqhvqwyriyxxin4onbsjxiklb6jwf@udvna5roegef>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: pkpt2VdWX72_0b_SDnz3FziWYyZECn8o
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a51c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX4LDMjEScBSpr
 rlcto0GHuL+Z4TudveQux4DSfQEnA9n/GVopM+7zXu7c7rHVWXLArStN80sRt42UIIfWf27ggQ1
 6pPOnnWEsgV9yCJ65q86GxI+BKzc+Uw=
X-Proofpoint-ORIG-GUID: pkpt2VdWX72_0b_SDnz3FziWYyZECn8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX26E1wvnO0MLR
 3D+9OCFJFpUboLMMX0A3Jj+f76f8C6JPeN1478zh+oLMx+P5rwfsYy3bIHUNu9L/kQeubmJuG0z
 aZsZcOv4bnTXYGBo8pn+kNkANCr+tnSJRYFB2WRc3noI5z5b/iVU+EVVZcYwq1iTM18g42AMXLH
 C00TlymqM1UPYFlFlauX4Xj3khbt6U2ovmPDXpprKoP5kYwbmR2me1YjIyOj5FaBNyG47n5Wefl
 /BKnIVpXnxPEOLxFLwEIpSkPHIomUKzndBHVOsuUOM5s0y9LCydeXgnN1qjVZJpSjYe9YhbcTcC
 1cqOpYuof7xPKAHvYrMiqW/QqJKEatoldmGDHC49H2zq0cBm00XR98WWVTxczfxBPJfdyTvJoax
 DlwmcRYP019magNrPOnwrHy4T47YVT1q+Bk9nu4/dHtICx/wo29AlL5Z+wb7IrULiYEotTmeZHh
 1wW5eeiGoJQmWKQMq3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:52, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
