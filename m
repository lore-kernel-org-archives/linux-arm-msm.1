Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF1D36D9EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790803; cv=none; b=FEGEipHWHfX+ulhjE2OQNLEh1bXRzRstnyjY3vCiBTkjsgRiiSIApFy4OtY90kOJm6PKglWmjDxSZKZgvIF1FJEioRoqrqwPF/oGK4FJsaH8vLmIYqv+RwH2/H7jO/AhSYSbr/VAKWVdVSJg6l1lT0GUPQvnpky2jgHPvPgZumM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790803; c=relaxed/simple;
	bh=/mVFux0aXa1C/13EUIx6SAvaa73hewo6ydmCVkVgnQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XB5HNiFHzZnlZs6loy8GJ57TrITOwLh5/pCveN3qW2+sGlV0ksXOBqnEiI1GX+qWehFeyFyJ/0U0xU5amzXMlr24blzuNT/dr3ml6HUiYpiLIejZla1c8v5fMDqEOCSapSnBWTvkafqH1oLPNk3fLGvqHv90ijn2RiU17iWrv0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCm/7qkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6d+i4WK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCm/7qkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6d+i4WK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55gvZ750872
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9o+UI71Fufpadx+8Ere4q7SEF6HwD4TGoTdoxZf8oeQ=; b=CCm/7qkgDiqZhDeN
	pdIqhE+GVeINyJNi1cQ5ukn7EGhl+SccPieeUnBO1W1N94dqwkAUfwknt/WLfLjT
	V01K/O2ppSimqZYdaay19XsLsNyYMSjiSVlgsoPj+Up79N9974cw1Z132LsQ5b5p
	fgD5GKMV3Fe12nHYXY3pHi3Kv4utbUCl/gixiDA3bLJp4NXsWFDIlL0ALU8xfly8
	k0Hj+OsRt5dY6Su5xIAahstAcSyhCEPgPqhrkzyxGJoD6uUdcSPX8NlnYhzfzxL7
	GomQaOwcrKS0u03JiB8ot3vTkz+jxfwydyMqBNRtToYD4kzXe3Qqh1K377y6D0Eq
	MSTIKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed9rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:40:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so10853085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791790800; x=1792395600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9o+UI71Fufpadx+8Ere4q7SEF6HwD4TGoTdoxZf8oeQ=;
        b=f6d+i4WKJXZcMi0k4UWNF3LS6ZY5yJ0+zAqJZ9VzAX0uOUvCaqUwoRp3lKtbjlbG8k
         lgieskn/e1roVyra9zRAbdHgzinsmtk9H0MJRxOmhTawgh+tmde57sF7+M4ekEfVSBSl
         vIlHH3roeSvLitmIO6i+JwxJT5S5w2dzw59RuHxM61x4e0V6zYaSHUYAf/sL9LLQd7Bi
         JdKG9v47O86MoC5oXQsrHtHQ5RKJhKu29HqYlKz9WJNTuNW014XBAXPqH3XIu/WtI2SG
         5grUSTKfj7hUjNprdpFMaglXX0L4jYuNiFE6r8LNNFhnmXKn2hMUxYeGWsCeHmqCDSmr
         J7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790800; x=1792395600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9o+UI71Fufpadx+8Ere4q7SEF6HwD4TGoTdoxZf8oeQ=;
        b=VoDYRzIH6ad9SIz+7JjvDtR7ToeGLqltRUfEgyzszAAUIdMFMVrw6daWihcLY8VlTb
         +rwHmFltmFKu3ZZhMERHk14QCG8tyCvOPjBU9dJy9IbE8IQQAmBfFSyL9+IMvQLHpe8s
         /PbBRUcGr+7NojEH386A0SUfiX6lqWfbJvAF1WpZKHlIC2WOsZFZF4doZ7Ga/QAu8gfE
         6F5OK4kvKSpzwvCzB3W8fxlh7ISAl28zlS6M4rI8TUn7mB+hYLgrOZkAMwlYVHEVElRx
         5y+IoAX8ooKxqYKVf6KZ008nWPm8mpKRbw5FUWLBhLeHvbTPmN0FoW2895NORAM7rRO/
         /w/Q==
X-Gm-Message-State: AFq9FYJ11K22KHi7HBbX85a04QdCp6WYG3WlxOxArKibR4aAtV4ZixRE
	CyZ8uVdB3TXVkbqQh4DBPS+YsM9r1LnoHHNDWVO48oGTh5rj+SBbLdZ7obKkO8q5vyooVDUTWPj
	mVTfp2A9TxHSpRKhugLGE0eeGMl2VEk0Mt+SaGcNG4qZLk1rvj7jS06iTO+eWKrIjusoT
X-Gm-Gg: AYBFou1CbiYl2fOMW2doqINof9QZ6t5BiUEgV27JVMtmTQVfKtKi7l+hIjJ2qaGcsDK
	oaDcIB/e0glBKPRREslnG9mQmlupeDEhoIMTKQZfzNCOWAHPBF3TY7rsuPvaLWSorYcpZQFvJfh
	GwUZCEQW53yI4bHhHhrTAFUv6yHUCCcl1VGHx/7Uym4Yy0aLAsBXYOBjGx5L5dX6/V6Y/Ges2Ot
	9ZKAlZ8Ve4LNhWT66Z882TcVRMiYRqlUEaXT1OIbgzpkuwM4UqNdIAljW8VM+SQnHolEZ4KyWCQ
	bpxgFy5yEgf560jFtXAAja/R/7dboT3/tYwAGF/3y/YX2i9KR0+eRWYjyP1wactzxCwWP1xHoF8
	3xe+Z+hDiSgfcrPWYMmflNw==
X-Received: by 2002:a05:620a:6f95:20b0:93e:ca50:d712 with SMTP id af79cd13be357-93eca50d86cmr791780585a.1.1791790800179;
        Mon, 12 Oct 2026 00:40:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6f95:20b0:93e:ca50:d712 with SMTP id af79cd13be357-93eca50d86cmr791778885a.1.1791790799634;
        Mon, 12 Oct 2026 00:39:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac969dsm426842466b.73.2026.10.12.00.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:39:56 -0700 (PDT)
Message-ID: <0d9d12d6-8bcb-433c-b487-7ed847ac4ea3@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:39:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/dp: Add DisplayPort controller for Kaanapali
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfXzWjuxBJSvONt
 0+FZc/w4SJoTLrvvFGY7AbJMp2Cjy850V3EAULfDlxh/4yQ1q8Rd+QVqimgUqmEtTYjhRGHlmQX
 dg/RBZIrw7+Zbv6UNiqlyg+Wf/BTE1LgcO1HN/WhSu8YoMyMvEhFt6WkMAQa3DxYZKat+gyGQ3E
 IvG3BXs51pnC2rBH+4SXXs9DXNMYc+hh8pAw/ZgINBGrMcXw1D18Mlmz8xHn/vJvWzJC89lV5eO
 FVCjjwfkG/nLTKZKin+eArZYLGcTfQGh+QN7ODhP5ruyF9wcfsFbmQks9NdiA7OyaIpKfmmFDWg
 s6Dd9Lyi+iefMGIZDnsuedgqNgJg8qPYBrQeZl6tDSMFXOXVQ3kBRiAFJcyuDR5vMRvV9sgHAr7
 tb6K/BRgaEQdBbWXI34obr9WMhUGlxCENFDRfUtZWy1rcgGiFSK/j1wkpDMIHgEt2iDINx+EvLy
 RSDpOR9+/0XUNUZjeeQ==
X-Proofpoint-ORIG-GUID: CqKn8vUH5Y9VrGBR3z0sUn6qBYYrDpSl
X-Proofpoint-GUID: CqKn8vUH5Y9VrGBR3z0sUn6qBYYrDpSl
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8ed1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rUnJACkxGFui_EhALuMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfXxzYNA8/rZaQA
 k5wkC5YlmBKVUR1z7Njmcpq2aD3GbJ6kHxb2q0BpOAp6tSizJA/OVSTwj8OpyKxzhtAjZVt6RLZ
 YI3aZwtb41D2eohth49xvEssvZQHMK8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120030

On 10/5/26 9:24 AM, Balaji Kalkonda wrote:
> The Qualcomm Kaanapali platform comes with a DisplayPort controller
> with a different base offset than the previous SM8650 SoC, add support
> for this in the DisplayPort driver.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
