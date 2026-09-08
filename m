Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC7F5437F2
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878399; cv=none; b=Ho7wVnW7+e3Nr/ymWON1n189m9QS1XjdWrm8ziPE+cp7cPPi7O8NFX8agwKh10ATidsMDpMdTAkdoU6G37aDxj85ZgI9eVBW0PZruytJcTzy5vIQBzvadsU9hqCnym8GRQoujZftItjM+CUOqNdzG/dYag8FmoCdnHzKSQjl51M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878399; c=relaxed/simple;
	bh=1joaK8aDf6gINARecUyPM7jTH11n+uwWquHYgC5ycBo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jf9ZcFGE2VVHYn6qOcmCfxmZ6+lFd7Q6LlKiTkqDWT0qzhwWt8/nnwHeGEPJzuHwZ9PploclVgE9tpgQ9FpAIw5tilcb7lkZkEMryhuF9W+lxDe/y6g9BFZuYiAJyUQrYQifrwGUwUqMRIpV4yduHK8sMTm1weisyYNTQoo/e9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jubzgs1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfH/hXd2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jubzgs1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfH/hXd2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EZU0b3815663
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GnrkNZL+INa2cy2Ro7Zdvw0+JDD23kLec3hRWayNkE=; b=jubzgs1dXVYggJta
	BSb1m/n8aZvWqkFEAgUXQ+rvlzUm83GS8zyizStP/Rd9LsSLBXkIlmVv1lHXNeG2
	jEu4jtVvpFYRyLK0lHDxbEod/P2NMg2GpAcXMsYMIiavlva7JyWyUwHP3IvMJf9i
	P5XZte/WQtpgvcj/Mdn9r7otMWKu1i9e5NrLsOaK/5B4j5zH8F6yMuFb6ZEsJLFK
	cUR8YwsHRFX6RB9F4zdj2A3cQyWVeqGNU1EuhGteCY85u5dbkjU0etnZPqVqCSIQ
	6IsQnd+j9KdOJ5CDyOj660cq+MqdXMhlqVkPJ4SMyD7zbhPERZ2mTQdxYpluKqVk
	8/wXww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp499kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:39:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc2229450b4so4577847a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788878389; x=1789483189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GnrkNZL+INa2cy2Ro7Zdvw0+JDD23kLec3hRWayNkE=;
        b=DfH/hXd2wP+dCOU89OxMA6nMbX6PfxgBVF0qtkxL4G7KHoXHXwjGcM8b/lQEKyb+nG
         /kL82a05DtASSBZ139IQ+7TtKNlSqE1L3OxBh1X34C1PiUrAouRkGxnfhG2gcomLtw2j
         qDXjUrGajb/DDJ7tJxZJyBFaTnudNJfJHRDF5drkJD+Pur1An666HAJKRRI23yFrL4a1
         PzwcW/fhDOELwGXk7Aldti1xh79tSrpxgIe+Kj8Jwzx/xNGuVdOfCL1Z2YgAy2ktwaTA
         tq0YXBGuSzMIln/5AIueA3zzOFRP+q+1i3rhud5CiLVOVKwxLlxbd/3KnzjGEb9JfTEC
         WXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878389; x=1789483189;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GnrkNZL+INa2cy2Ro7Zdvw0+JDD23kLec3hRWayNkE=;
        b=JPZkv9froSRQHcvgX0sgU2b2izQBpeApDl+2qx5qvLH3TXg0UjS/YQ9tj2EGfwrC6m
         NseJ4ok/iRdy6FTIrGiTxA3Hujl3HSVwfHNkDgeCClJQyLDzb8InSSelNJBpE9/hhAM9
         JjJ5ZB6BgagLHDQPKoKKQfCZia2Sy5i8x+w2EY3rJoUQITqfP4RJbCb2oV/LnTX13Ots
         /3js+i2mxRGpClQhpiUCwEuzg1w/6NQaWXXNq92pLmUQh8l0k94Bi+5ldIFT0OVXQcbR
         9LjHukoyUsZb45wg0aAwWS1MKQOhneZRztB+m7A2DAvxnUBW6XvbVG7g7KlMsgUm3Me5
         QekA==
X-Gm-Message-State: AFuF++kfAE1mQycsqdUB4yz2k3GAOR23EI80wa8zPIVXv7KEM4wX1ddN
	W0zACCL+VvplvmIOHJTNW1zJHa9BztcoKm16/zdUyKDVObUxpdIZQnvAAPhjuVx+ySiTaQ3MpD0
	bkPjKZ7Kp27b2/6/413TB7CtRkhzPBJjUqd0qSgdi9GlAED4hdsla0IuVM6y9DLr37TlI
X-Gm-Gg: AYBFou0AetX+x4EW0W8v6ZSwW7EWmDe/ZOGkPqc6fQVqtD4YEUD6Ngc7TsPwwp0Krat
	EykeHDyQ4Fic7+wDSUjmcemD90hxfNsbszMxVV1RAIv3dJBh4LH+Y+2sT1t1JBefD5EHRk/vN5E
	fuha8sMbFk20eQgdpClnJDd1giIVSxkjWu9LPJFWzJHHEpgsDkVShmjG6F3Y5qjRIRAmf9693hL
	ATb/uQVU7uQFfsqkPMDKmE1pmaX0naEzmdtmgHWgzBw+Dv1XRCJGli0Ly9JqS+ecMt/dKb/mzGo
	rTdblBmtVcD2WQ1wms4ZBM6p1UfLcmteDoH9RtEgnGapWVi4NQaKNPX5YfpRBbliZpsj9M3Lpln
	8MIPSc6hEDVqjxaGeMjsa6kkMhfeuww==
X-Received: by 2002:a05:6a21:880e:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3da3bdbb2a6mr41696236637.20.1788878388747;
        Tue, 08 Sep 2026 07:39:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:880e:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3da3bdbb2a6mr41696167637.20.1788878388154;
        Tue, 08 Sep 2026 07:39:48 -0700 (PDT)
Received: from [192.168.29.80] ([49.43.227.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm31086850eec.4.2026.09.08.07.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 07:39:47 -0700 (PDT)
Message-ID: <9303e64b-00e2-4b8a-b92f-b96c0a3a5546@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 20:09:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2] interconnect: qcom: implement get_bw with rpmh_read
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908-topic-sm8x50-icc-read-rpmh-v2-1-b6f1c4205450@linaro.org>
Content-Language: en-US
In-Reply-To: <20260908-topic-sm8x50-icc-read-rpmh-v2-1-b6f1c4205450@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa01e35 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=lJ7UW0itocO6TcfiNZNlOw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=TcFiEEHan0Z3ZoItQ4QA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6IFiT8s4ishr615M0OFz7TAGxe31XQHS
X-Proofpoint-GUID: 6IFiT8s4ishr615M0OFz7TAGxe31XQHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1NiBTYWx0ZWRfX29Wshw2qoPQc
 C7e5tXHpdzBDCHUdjtrAsL26Aafz4mGjKIylkHZvZgjSDOTFwKb3cm9PL2CIbdBxRYzYcQlox1/
 fyDb/nqsHyKF2Xiq2JdehTv5z7bjH0d3lxUPhQOOaKwpIQxCBKRktPqdaNb24Bb/KJvsPrHvebk
 2Il3OtV8R8fx0oF/Ht13g2BPppaYVfMXykB96906byZR63kLnRYzEWS8i4kMZETiD4uKYSIjaew
 MGQgmbAdXYdDN+VnvZEy8qDqFBDo/73cHkFV5DqWjjg1zB2kpahJoP7swSD6MsCAquLI6kEGfu+
 jUJcIyBOU3pKVBXP1TwRuLhNiubfjWFJ334qDWQiJJWmFjO1AEyBnejLzr49gfHGtHRjIDo7S8q
 rKXA9kEFUZc+G5pSq0AH2tjNOKfnlTmHEBOISh3OZzn42lIJDcdNVktKtLJsha9YS+CeLcVtE54
 Z+Gphsu0659ZTp2In6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1NiBTYWx0ZWRfX/q7gwieyhLrK
 6WEYkYcAYTP/3ln1xdIHZDyfM8Y4n6t7ubrLDBSbcw9MEFPL/v/Kgi6B3o1JoXC7BVTWyUrwDCS
 4QNbahQ2zVxr34DIyJAg1n34i+K7hko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080156


On 08-09-2026 13:39, Neil Armstrong wrote:
> Since we can actually read back the APPS rpmh interconnect
> BCM votes we can actually implement the get_bw() callback
> and provide a coherent average and peak bandwidth at probe time.
>
> The benefits of that are:
> - keep disabled BCMs disabled
> - avoid voting unused BCMs to INT_MAX
>
> If the interconnects are correctly described for a platform,
> all the required BCMs would be voted to the maximum bandwidth
> until sync_state is reached.
>
> Since we only get the BCM vote, we need to redistribute
> the vote values to the associated nodes. The initial BCM
> votes are read back at probe time in order to be ready when
> the get_bw() is called when a node is added.
>
> Tested-by: Georgi Djakov <djakov@kernel.org> #db845c
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Added tested-by
> - Rebased on v7.3-rc1 now the rpmh_read() is merged
> - Link to v1: https://patch.msgid.link/20251106-topic-sm8x50-icc-read-rpmh-v1-1-d03a2e5ca5f7@linaro.org
> ---
>  drivers/interconnect/qcom/bcm-voter.c | 36 +++++++++++++++++++++
>  drivers/interconnect/qcom/bcm-voter.h |  1 +
>  drivers/interconnect/qcom/icc-rpmh.c  | 60 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
> index a2d437a05a11..9014bf20adad 100644
> --- a/drivers/interconnect/qcom/bcm-voter.c
> +++ b/drivers/interconnect/qcom/bcm-voter.c
> @@ -261,6 +261,42 @@ void qcom_icc_bcm_voter_add(struct bcm_voter *voter, struct qcom_icc_bcm *bcm)
>  }
>  EXPORT_SYMBOL_GPL(qcom_icc_bcm_voter_add);
>  
> +/**
> + * qcom_icc_bcm_get_bw - get current bcm vote
> + * @voter: voter used to query bcm
> + * @bcm: bcm to get current vote from
> + */
> +void qcom_icc_bcm_get_bw(struct bcm_voter *voter,
> +			 struct qcom_icc_bcm *bcm)
> +{
> +	struct tcs_cmd cmd = { .addr = bcm->addr };
> +	int ret, i;
> +	u64 x, y;
> +
> +	mutex_lock(&voter->lock);
> +
> +	rpmh_invalidate(voter->dev);

Don't see why rpmh_invalidate() is needed before a read request.

Thanks,
Maulik

> +
> +	ret = rpmh_read(voter->dev, &cmd);
> +	if (ret) {
> +		pr_err("Error sending AMC RPMH requests (%d)\n", ret);
> +		goto out;
> +	}
> +
>
