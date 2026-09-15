Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC32A3A4F51
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465994; cv=none; b=iiFpjqGduuFwU2aT8W04u56JHTd0xFB3pTOkXZNBgKiVwVrogiJzvAxTNieN5JxaJ0h5PY67Ixj4BEjhCa6thdFukDBH4kVndQG8YQYKDqq9z3DPEZH8nDn5s03/KwgNBhQa64VJMCVD5oLKQBOkJoIpu0SY3PzFGgtrMhCrJMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465994; c=relaxed/simple;
	bh=MFBwAbgMkOFYCA/PTPGkjgXNbqfLFJ8kJ0lsNhxyPYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3ShYzPxmQscUWcCyuGstZUhqUf09XyIZycpQnV1ftWiIG9Q6oly09E4PoL9QoBkocXLEgyndXrtLW9NgNHKLLk0tl9lIVOBKGOtfB4WH9V1NPYj4n9Am43IFfm7gGtPjIwujo/2nwed3wjsQMDDAzcoI/9ota/PaSvi1VGgxJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwK7sicc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJmoJkcg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwK7sicc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJmoJkcg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hFPd2833254
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTcCgoLPWbWHdUyc5NakV3yDJeiPqNYhqZCxQG91oaQ=; b=UwK7sicclThnmSvT
	RTYKA8A+wcK8W2jGYdKlq7CKZ/rBLkBB1OA4SBC9MIDv5z0YvZlrag09FqzFdq+W
	JKnhh9bwrlz2ciP2rOmcPYU6dRL9j3rlsuLKCFqrKnegsk1UyrkZnXenLq2f+ndv
	5hbaS2z1zbKExAlyEXdAF1Dgk7n0L8sjpSEK4b/3GVyH+ceKFu0LHH2XlkbRHzIB
	XMK/JkU3w7QPYXtkk2wcBELXVi5TCjPA3NVZIIGybsyNHOBzxKS/OTBhObsk5vOH
	odF69l8AnKiD0BP/UJejlwTamNYcDE9lmHg9gU0sYO49O74ioo5AOASyl4NBsKvJ
	ouA60g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd9736-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:53:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso3526628a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465988; x=1790070788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTcCgoLPWbWHdUyc5NakV3yDJeiPqNYhqZCxQG91oaQ=;
        b=MJmoJkcgNtzfRTOj98jS0K7wOyHmEKO0VASG6W1mB3geVSEk/f6+ZjzzyaABo8UPD6
         nplj+sO2aU5D4CH905bvMpHLLNOohwLDYFy/QAjhTr3oHNI5Xs/35hyNZAms63lT2uWl
         w56ehsARn+cvfBg5lgFTKgJU8bVhQLe6lbvxeeb8cLkpE1LfBVcjdAkJ8Ev1D6RkhWbS
         ud6N4niwKyzCR3+q5+5b8nXST1SBt6fufM73mMiJwuT/kJiHqblU8JTRPyV6keuH+GV3
         4p/zWNuGnTaZCI5q8aFn9/revhfbx+ZBXWHPs60NxHLJKa1Vg4Tn9i6WcznYqP1RBxBo
         +6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465988; x=1790070788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTcCgoLPWbWHdUyc5NakV3yDJeiPqNYhqZCxQG91oaQ=;
        b=TSDIid/XUNJbWHg4XE+SdOLcgiUVniiXA+VbCqNH95S03YlanA43BAposyHLAWSEko
         BVtyPebSQrsOQ6KZLwd7Ltjvg1vbo+0jztbikMG9xoOoR5LbFL848Fs2b7u2rU0TPRKK
         kfEwuJEAYDO5GKp3cOHTKSOy4NlGFpWWr0QMbBmP2YPpNG7FZDUftiG1weWkaDEqUbKk
         QIY1ACGDUirwxW7IWePwWSUGqI/NqgGm3IUZHm0OXMOv2YF8niiZnV+zl77tmudgw4BO
         6kbfB8afODa0FgPzY+UxlKfkYWWdNzgfeWUInNgQKlGsd9QumY8tSmg8WrC1Ygp4ubRn
         DUjA==
X-Forwarded-Encrypted: i=1; AKwUvByb4E5JwwZkLAdHeepzv0ZgsvMAPpEUFUlGgi7Tsu7836VjYppJ7oCRtYf+zOXd3dzSdWIKsaHNgtO+5wO6@vger.kernel.org
X-Gm-Message-State: AFuF++nbx1C2Og+yc4+9pq1u/mFjLfnOlOh8MJVIwqqeN8D1OHUAcp4f
	D+jNTT693Y8hczVsqaNngQ3je9OGypPmF1PvZCyCUmgTzja2lv2Aa7ijbJvOm4D4nIPhUS9PvPX
	wgTnhdOEFiuh/RlJ5ZlRMwQXVnh0Nt4omw/xTOHW0zpndHoQXz/gKwHYeuY/atJamU0Hg
X-Gm-Gg: AYBFou1DhZg8NL8u0Tmgi2RAkkEFqiNIoTfrnvLW4gkMSiFZBbTHu8L+qBoSH9mTeMX
	LuGTsue9++TBywkG8QquBbfWEEXzx59yRmcoYRhTC7+qvxdZYZDRipg2Y3t7eyqjiqY6+hEe2r4
	yenFZicGaH3e/V1XRjFxC4WL1VueHG1IDheehF5tXPzVyfUHxElvtHzTxX0JeesT47Ql8c8XPAB
	vDyPiax0WvP3HXhim9UwFtfXST4l45NwbznlUfCrDbYvxmFHA6d7mgK9xoQZFooYibBZzCRp4q+
	Nlgd3pV6Ey1YgS6Vpl7AM3uTYlusiIOONA15cKT5liZ5PqoncNfZk+Yg/8/Fq6fcujb5exTQVfq
	0sKNLOYiH5QB2Nd56eWKYtCdKbOZap640
X-Received: by 2002:a17:90b:2692:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e10c936camr294279a91.8.1789465988308;
        Tue, 15 Sep 2026 02:53:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2692:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e10c936camr294223a91.8.1789465987854;
        Tue, 15 Sep 2026 02:53:07 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1439110be78sm2856174c88.4.2026.09.15.02.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:53:07 -0700 (PDT)
Message-ID: <8314e3f4-aaa1-4eac-9fec-9becda010120@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:23:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-2-cdff2c67a8c2@oss.qualcomm.com>
 <he3muoyyhyd4rclkrvy2ut36rzvp4kdusabpvevcrfo7tw3plp@yddqy4afyuym>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <he3muoyyhyd4rclkrvy2ut36rzvp4kdusabpvevcrfo7tw3plp@yddqy4afyuym>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX0Ro9BMd4lbJo
 Qou1ssNYkzfWn0cxYSoBZhqxgwSk9iO9CrNSmr5v1kFv+ggyHhQ/8esJc6+9b6fq1aE+N8NgwkG
 CN/yUkLr8awU0xr0BEm9FHGCSp7qaE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfXyV1pvmRI9EhL
 /UWjO69jeJYo68FSI97DXhF73LHuUgK6hLo2qHyvWB5UA1kCmHmue3BMivgs1s6gV2Xl1OqLwmj
 ASAxjSHeRJ2DMP/7lb1xYREKOz+nhT9masq7G4WaUeiEQ48l01jztoLqCLGf5NV/hu4ej+BOD6X
 pUkrHyxVAJRvZvD2cp8w7mJxCEflmoY7Iyk3zCXYDH+wJYVYXPVK0ymJBl5mKv225aq5BNi8h3j
 +GeaMuxs0uNdBh4AohD74OA6Ekt5ZEEDVXnPrxhdd6moXFBOMlCr0yL3mFz4ujkqZ4dp7gVDLpZ
 +CuV8il4/4M8HqueQSlPo0KHCD6aZs+j6MauruDtgGvnAOQcEZ7FG03+Ff9U1UJrBtOMqolFFo6
 ukffM82UgegC6UundnaHIEuRxYX1YuKjnwk9E42FR1LVsEowyAS3EZNzlUezGzpS9beKN0RJrPL
 xcgy0JQcPz8ohEkCGgA==
X-Proofpoint-ORIG-GUID: st2CNO06v2POoC4SqCU14c_VJuPan1Vz
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa91585 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r3UcPH_kFabEW9HR8wkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: st2CNO06v2POoC4SqCU14c_VJuPan1Vz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150141



On 9/5/2026 11:22 AM, Abel Vesa wrote:
> On 26-09-05 00:20:43, Jagadeesh Kona wrote:
>> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
>> platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> No fixes tag?

Thanks Abel for your review.

Will add the fixes tag and post next version.

Thanks,
Jagadeesh
