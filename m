Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A74412BE4
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774285; cv=none; b=ffk46kIU2YNtghcazmAkZbhVuzc7LK7jXV+3DlAWF8J7pomhC6RHrxtjL1izv3mpvseCYwbptAXOHby42Mn2c+pjZTEesAimz96FKHsqh67hD5U9+YwfbNt6wIbyy9w4cN4ZV8REpyfPZ0UnMHehYWv40vjGp1TUN16B/yXBw88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774285; c=relaxed/simple;
	bh=tsB9Vj+XTt64+OVf4kxojZVD84CZESJvrBN7JqUuMIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8awduXlAHu5kp3kjQI23VCL9XIDwofBHp8xj8mrfXDq+ugJPqXsZH+GP5RzHh/0wKlIogN/HrX0vDnCKmKBK0UaK2LSJTDDHBUdCdi5xjX+m3r91CXCPnaUnB6TLbcDLSYHb7cl5BgBqgS9Wgp6f++KwGpNNMuYyuKYaAPmpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADqQI+Rc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LC6NCfxM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADqQI+Rc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LC6NCfxM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bGm83020876
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 09:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tsB9Vj+XTt64+OVf4kxojZVD84CZESJvrBN7JqUuMIA=; b=ADqQI+Rc9/PByyKr
	oqA3W2qgI8GFRt5Vm/sZ/IfoqfXK5NyZUeaVmbLWnYDF0LbkofGkAJAy2HFl5c4E
	a/YMUUQQpCbvrn30v6BfTEnBxlQxcMmy/tS2+Pz7KRLyDTjYES0nnr/4nlMDeEk/
	W/mhyL/12dR6dJX1LIfnVwfEoZ9P6+v2dlb7kSMzN/FIQp4mfIZy7X+ohGKGLK0r
	wJTfAeoeraGL/kO4nACcCgWG6yQynq7TcQCouNf7XZIeLwqNydxbEUEtfDhsJyuO
	lyPCDkc3ZL28acIZr8JvRrHqis61gtzNgOpe+bEjhZWks+AnL2EDPtLqiPgOqwWl
	ifdUnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw20a53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 09:44:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso4183382a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788774282; x=1789379082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsB9Vj+XTt64+OVf4kxojZVD84CZESJvrBN7JqUuMIA=;
        b=LC6NCfxMgWqdI5WF8mMnZHjKFBYWZdtLWpPw715RXQ6LAdbQkAVPqyvufmFOqKt00l
         NQ66H8/U2VLX5JIDQoIacidxnztTEE6rRVWVPSgivBi1T3Q6JUljDmF0zxes8PWUS8u6
         AiipDl77DqYTOcrPb/o7IfsNaTiassvPTd21e6blES6ergfu2BPo09bxxSQreTDo8Rqz
         q4gGbMEIO64UCiFIZIwtSw2EYF3WAY6k9+DSzP82cTBeuzBKhYKzRFVz5MKDY/pTGSmL
         2jPdFI1ZabtB3GlRid2FW57/tnadlahjCIsJJWToRvUMSIM9lC7QNatMH10/bKkJqYrG
         zjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774283; x=1789379083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsB9Vj+XTt64+OVf4kxojZVD84CZESJvrBN7JqUuMIA=;
        b=q1fpq9G5O45uYaDwYTQp89u0Lg/8vCBBg61lpdyy659uWKtWQbi+4f+2A5QH2rnGOt
         e4/K31eHJ+v2Gyw43ae17AZVfcet4Q+xxXulMxCGJTCD6oZfq2JdvWfv/aw0FfvxUug0
         +clujUmudJap8O8SPEVbp3r1ACPztl46R/9UEqO8jq65wT8DPGIFjSf/D6Mv8pVttizD
         0UkbxcWtKCSYVwye77CAhNO2reSixMhWBOdzgdVRm0WlYsF1wB5STJvgewdDOdU4UToB
         KNoxVX10R1FboR/3iOITV1kPt2ZoFcufdi87wpPFgCk/+rj6uCZ43aASFC3oyaxwUka7
         50Cw==
X-Gm-Message-State: AFuF++lu8bOpHNukdpzPbOR8+hJ8kSkuN+//k8QV4Qp0eYAgRDn6LRFO
	eYPdJzlJhQQoZbKqcHOMjvEy01pK2As0c9ReK78rd1HAQ4+IE531yPAXVEOvAR4LjicZPfHPESh
	91sxj6V+T+u1llOZPkLb9s8QdT4tY5/YHqs5xHdOxHOHUs2Xh9pch4kQieI5QEdttTsIb
X-Gm-Gg: AYBFou14f+s3fNn1f6h1i+GnGo3SSYAVSYiSU+INVh8TKmyEtkiejWnryj4JEZphO5Y
	NvUFfqBYapxOHt2zJ1Sgb5hH/9VV/gjHEZAkCbR34WGrPX2wjcpev+COuFVHF2QCZG11N928eFs
	ZrUY1E9YbLVUEg87Sr6ukABFjTmhRX2CZs2jX3risllywa8/NEKUFNj8M42A7L8ui5whAlICTjZ
	O7ucq2rOCNtavIUs96clbfv1+5yUxqRAjIcNyB9rOz+FOiow5X0G4KKsp9pUlOFtCD3Sz2RoTbz
	itaf8P7KhGqsT9YZcUUQ8wpauB8eH3e1BmES0WttQwYjR9+DrB74wpySlSkWWC2Zio1e8L9Qjn3
	5lGj3LbNhjNp7IZ4/3sOiDBig+Ccy6wo=
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3da39878551mr32148266637.0.1788774282508;
        Mon, 07 Sep 2026 02:44:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3da39878551mr32148214637.0.1788774282034;
        Mon, 07 Sep 2026 02:44:42 -0700 (PDT)
Received: from [10.206.103.40] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm41820620eec.15.2026.09.07.02.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:44:41 -0700 (PDT)
Message-ID: <fa897e53-2ebe-4322-bf73-98788854083d@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:14:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dp: skip LTTPR init when no LTTPRs are
 present
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-3-2825e5bf8a96@oss.qualcomm.com>
 <315db50d-6553-412d-8fca-a4b4441f881b@oss.qualcomm.com>
Content-Language: en-US
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
In-Reply-To: <315db50d-6553-412d-8fca-a4b4441f881b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Xok1vZC3Wt6SY0eGwgEWg7GZ7DK8SebL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNiBTYWx0ZWRfX+Y4KrJwnY4hL
 +xnItxfz0n9tOIgSKITu9QitAWkXAjxM3Xj3Oe0xxvXk4LnWzDJ3Ztp7JPVWz05chYy00CaP7uL
 cSsL+8s4mCHGaZWcaJBRvxOXsffFLm8=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9e878b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=RZhGKP1uXM2L-Qacb6AA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNiBTYWx0ZWRfX48kOVn+HeaV2
 JOSneyCcV4znIiwkMZqp+mm/G+BXNhMZnCCEOWx6+77iSou1g6jEtEe54ahYSaD0HpNfX8V3VH1
 obv+QgendJ2kp4sztNpU8TKOszV6fiZMaoeMpVcON+vt9KPnfF2Qka50XgOmBvt9UuBcThDZ4+R
 j9qZzjnIy0Sq88kwpHpCY+/VprYKFOMcssJZP6xemn205J9/kuLR4/FF5iCp2POYfeqmISDJtRx
 0OOIi45NiFJu5luGSA4uM/+02JgIdn+YCrNmice9B93A67E9iIy7OgwLQ1Mlxql35Oky+G+9GCQ
 lH+P2b8XSJH3dNuOwkyjPRNFZ5+isaJmn4zBSF92X0aUTxPHg6D0RkKPvcNN3B8mvwp/4EXwV5r
 2FQtRXYTCOcGQGxnbwUOp+dfa2yoYEl5c8emlfXXK+4xbjuPqXb6BkoWkqBVhfH7AWGXDN9/3tk
 GLBHxW3gGeVT+3Wrb/A==
X-Proofpoint-GUID: Xok1vZC3Wt6SY0eGwgEWg7GZ7DK8SebL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070106


On 24-08-2026 18:45, Konrad Dybcio wrote:
> On 8/24/26 1:28 PM, Saurabh Anand wrote:
>> drm_dp_lttpr_count() returns 0 when no LTTPRs are detected and a
>> negative value on error. The previous code passed the result directly
>> to drm_dp_lttpr_init() without checking, which would call into the
>> LTTPR transparency-mode setup with a zero or negative repeater count.
>>
>> Add an early return for lttpr_count <= 0 to skip the init entirely
>> when there are no repeaters in the link, matching the expected usage
>> of drm_dp_lttpr_init().
> Reading the body of that function, I'm not sure your statement is true

drm_dp_lttpr_count() returns 0 when no LTTPRs are detected and a
negative error code when the LTTPR common capabilities report an invalid
or unsupported repeater count.

drm_dp_lttpr_init() already handles the zero-count case by returning
early. However, when passed a negative count, it still writes transparent
mode before returning -ENODEV.

I will update the commit message giving more details.

>
> Konrad
