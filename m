Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D648FF80
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331816; cv=none; b=e22P9yC1p2DJ5dFcjTL8MyndAqVY/ZCik0Ze1hBoOY0AKUrhgbNM6xHsPCClWoZ6hGGPQMJun8kHfmapZ1aO+Ef+dveVjLBobku+zgr2Q1FxcghfJJuBME3ewpSo8YXHmYawI52Qky/JjcUfX44hm5wmqHU19a2FR5c4+l4FhWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331816; c=relaxed/simple;
	bh=zkw9Oy7OVJ3/+Ko/xqQatvs6D7hDS7htSf/ch08AmTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAlUPyIv5Ene7UoL2zS5POpQcAA7kkqmvraBqWfhhmN2Nay1agEKiwUL7TArWXxiUIM5jn3fQGviItzk2/LGEY3q0fPaDHS5tAxLiahN8rZZwYXZ4eG6SHAcZGn42zvE1enQHtqRz4RRZptcctwEnbTbU8NUUys86Be5RkFDljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUdAgpas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvX/0/1n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUdAgpas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvX/0/1n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YQdW2911318
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRIuXhUt+6lCT0sXfT+fb9ye3Qdl9AA2OjOOHlqa1BI=; b=bUdAgpasPYQZvDcu
	ZCHKa0MXc28TOOGVymqJ29bxKleFzaiQ81G0vxCFlC4/8CLQ5c+6AgwJ0CGVFV0v
	cPLA0N4TQb9MqADLQiPgBpEPL4wJtHx09xI1CCTtwPgM13INaernryPLDUD9x8zS
	CPz33lBdkH4YeFI5FQ65tTdRnKpJFKxB5FRxR92mMj2BRRvRD/Z22nfUhnMr7PqO
	1T3zqc6clGRDciSeAj4i0HnJdVzacy/4lDTuCTDz8KX/g3MfRprl0J/sPaPJ9zYj
	Gu0MVjoiYVeCk9aQhcfGUPvCv3PY/KXmoKWKCIyosD6UaxLXF8msa4XKVGY4wEif
	wYGzUw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm5143j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:23:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-914144bb388so2009836d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331813; x=1790936613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRIuXhUt+6lCT0sXfT+fb9ye3Qdl9AA2OjOOHlqa1BI=;
        b=YvX/0/1n8O/TjIghI23eUo6jP7zGxyHydJUdH1wb7/zT5Sj+cBNBQUBldS+I8HF8FT
         mMzK6MsCr13WqcQP76u72vdTqVGh5FZmxJG5TdGEG3c14GnOIRBbqDiHPIPnEKG+rahw
         HuRH14qVEGHC4VUvS08L+y7oWc9sImrbil8h5tX23aWp7cQ02zywo8g9YPQmXe4yrHab
         mU777+1Q/MkVLOu5538r3geWgZ+m0AlX1a048oDNrF8j+H8D9xhOyG5lsgXHnf7BYFkT
         alqERz87c60ph3Nt+j7OyXPZPtMBMgKTI7SoOf4y4uDvMdqfxA9b12A0C/cp01WpVO90
         /ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331813; x=1790936613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRIuXhUt+6lCT0sXfT+fb9ye3Qdl9AA2OjOOHlqa1BI=;
        b=s06uNO/URwyVVp7T7wKVqiewSJizBf3L7tGoNiRan2FdmFJzJ83KFDpYyfqUnRkwPW
         l61CsVsvD36zvdJP1R9/Cia3uBtGG97Z2YwKGFlOC1F2wgGYOWHdp3ffVNyXqEsL3pCD
         /1xgjCmhhcpaBhnUvLR0tEXfaPIarodDR5SdLpTNC3+QxqwNHRCajVkGZWXOccsCutVm
         Pit+tt6WTbuiu6Wj0PBN6ggO66j94ewSrgKzZ7r8WsMmJrc2or0drYcx/0tCOzXxR37q
         twONZtfqlAfMdPtmTqQ277H2JyIejrjW7HrN7lX9S0EmmNLq4HQidIEncO+6mAMfOsOa
         Zvcg==
X-Forwarded-Encrypted: i=1; AKwUvBxiCms0dC6nwnPAotrryOdPJBPKCGu2H+T2EzPRsRRDfP2wlq14GunO+e7Dqiy04eET8CWb4GjfRhevOJVZ@vger.kernel.org
X-Gm-Message-State: AFuF++m8P31zRwlLCgc213F+2Jlv863KJc4JpQD6cDpf6I9xMdkczPTm
	WiFmMfDc1nMzxKLoei41kwYx0FO98m42CK9ikOCzxTl1KAequUCe0TnVmcgxLhR4yKOyrO7X09v
	VqSRtEdDbw3mmM3SaOY7UDEDtysHVgy2W8b/6OGDLSEIMvoalXZ6+j9eANVOoiUu9qz8Y
X-Gm-Gg: AYBFou0/sAypkC4nAk/d3CeAf+sQKqFMk+hMUNpc/xFvQtchGKsYIW4hxA7SSNjlDAM
	GC7zimYeh8Ggwc8kB5YIDjpviurxmKwB9HetKndLqXU6J3iKHAKjBuQT07pA4zG1ZWn8JvbtNyB
	ERx4mGc133CK9e5gC3mdaatUQJ0yeIMKBd5PDHeaWJBgo+CrAqtgjHnlbRkgTFzOEpZ9lEDmANF
	jpeRiTdYfwp0TVNh/CC5BK5D3+nXzQT0O8QsaSe/5D9WhskrFf1T34gXdFDbidurEJC3lMpS7SZ
	f+MONWZEzDQEuZtW3rNKVIJMosCfcT9DYSTC+uC8PxTStrzPfhGZ7C2adab5rtclHX2+NLtSkDk
	y0+88DWxtvTWs9fdT6wfrzA==
X-Received: by 2002:a05:6214:5199:b0:912:6000:e8da with SMTP id 6a1803df08f44-9142f6ac41fmr31577956d6.2.1790331813024;
        Fri, 25 Sep 2026 03:23:33 -0700 (PDT)
X-Received: by 2002:a05:6214:5199:b0:912:6000:e8da with SMTP id 6a1803df08f44-9142f6ac41fmr31577576d6.2.1790331812553;
        Fri, 25 Sep 2026 03:23:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5e09985sm852677a12.28.2026.09.25.03.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:23:31 -0700 (PDT)
Message-ID: <86891d60-4a30-4b01-a025-14afd40fb9d8@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:23:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: hawi: Fix PCIe IOMMU maps
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
 <20260925101309.3826038-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925101309.3826038-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w3sv3EdLcYHm-NDo2HYX9jy5x4xtCWeu
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab64ba6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3CKlJ7abimYK_f3-Io8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX72+82j/0pcIj
 yVDJGtYhhEyQTuOU5M8q540zt2wzUQIHFmWgL1q9+FE982ZpjDMTZX1YWRRstWSnCxhJQ22rk6b
 YRTRa7AhFcxpJMCqWbt7ToxQj/x7RDBiX4xK3GjCLHk4cbAQw+7/kOp8Q7+5aKuabUry3NEuDnW
 K784gLXjW3kZCK+PQCFbUpbbZS6nMn8FqmGth64nKHJ4xaCX2GOOnYA1G/Lg/FGx6Pti1ZUFZer
 VanfUBI4kTu5dxBHTAgL1+n1OlFCNl0u+WlyWYMxUOt0Y5BaQrfd6TM2/gJq8KK/LGrQKd2zV0I
 erQ2o59Y5LjbgV9+akZGdGfRLl4Q/yvY3tiRP88cfMR3jMmA6bj2prJK4LtVy1aNrDY9kpdW5Qc
 F6a5OAlh03Qs6LV2TVOhUdmpJHvF4Lo53XBB2lJldj+T6KUZxKQzKn4vY6EIo5ZMF6BfFEMbh5S
 Bjlfpg3KKEqUXO78C7A==
X-Proofpoint-ORIG-GUID: w3sv3EdLcYHm-NDo2HYX9jy5x4xtCWeu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXzKyaZxst0oau
 KZUy8qpoJrHePiWTUX2o7TFUlvweY6vAazjIcFaCoY66R6gULFHqtqgUHPdDOkt3/r4sULRN4Y+
 n/UYFssn2MpVNursCG5aC13rBkLddFI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041

On 9/25/26 12:13 PM, Mukesh Ojha wrote:
> apps_smmu defines #iommu-cells = <2>, requiring five cells per
> iommu-map tuple: rid-base, phandle, sid-base, sid-mask, and length.
> The pcie0 and pcie1 nodes specify only four cells and were omitting
> the mask field.
> 
> Add the missing 0x0 mask cell to both tuples in each PCIe node.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
