Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF5A34388D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344783; cv=none; b=YsfG/UuWsqf6a4ZnkF/VLfpkhyjvt9nQw+yXwjdzcaCZd0pT/KT6XRsx9N6vlADc287Z9W+dogqPlmOAnoksG2Qk/mq5imwkmNQNPBDIl7bQNR32WeXyxA1wsuIR74kQy57eXZUxInfm5d1GeHLi8Ie+8MncXIzzd9YJ0WwM6eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344783; c=relaxed/simple;
	bh=J5HyjCo0xLWf7G9hTgG6q8VLKjpFppvIjXzqR/QHcow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nkz4gljkO9WkbtqLg6NjJsTl88/zndIcJE9nL9WImjhObBAdEAWOuAscmIlVjrOebIyU37wNi/hGFJCcyVuPwT60H2TX6f6+MBeNSVVuaXzNeTdLTT5Svo/2GtjwyOYkyNyxrLUzpDijwQOj+587ifV75wS2bkK2It9yRs86ldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E42c/wyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MA0MIwbp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E42c/wyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MA0MIwbp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pWce1240653
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxNP1XVIU2h+ocn5N02vtGQLncr6TSEDgpCOcj0bI6U=; b=E42c/wyl45umUSN1
	4Zta/Lah8hXVWDnlsuUjOgaLwo7Vb29j2XexfqRSMg+LJhxALPPTMWaOx1a/IEc2
	yWiLyMR3ty87Zn1fGTrDP0XvPvRIqIjJvZgWCO3SOj6zBUy8QwGXyU+qqTQG0RLb
	ZEVcbs1W5iMuLYpviyXHpngzRmMOGRgK7zsCLmhqGMWx5ub5malfzP9qw8Y7IqSM
	N1xxThTfzQftFD1OWaVogYmHGC8OvmYHkieqPgMboULrrLLQ+dev/4TcaC0MKkYH
	G3/YgqKKg1xMqD8HnzX5dU+x1pUeNDFLZrWFraX1oBDFuaETiq0KZ2ho/FpSKYlx
	sjVzGA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3r5n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:53:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so1057295a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786344781; x=1786949581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxNP1XVIU2h+ocn5N02vtGQLncr6TSEDgpCOcj0bI6U=;
        b=MA0MIwbp1Obx+0D6vdZNlnfFoSXVDDrTOeC9i6vPA08ZrfQm91m7fvvDWXUFghkznQ
         4f3MorbBa4c01gt+EEEGslmng3i/m40GxRvKJOvqY/Y4w7e4uw35YplfVBQQr5VSM1kG
         eJKSMYK8Qm5Xqf1rhv3Y09XHCeEbxIJcT5XWKsqI4l9NZZMbPiWtzWK7Jil7OqNX9W45
         IR2LK7QVUU4g5DMJ+EKqbqOcKU+izElXdfH6W1QBVme0XO6MPu5IYM6upig/qPHxXP6m
         /fUTvMVhRNIPL+wr3TLfLCnjfSeYyo6eYqhIcMJ8JRzs6tU1Ynp9b//FNj+5+XVmdvP/
         MvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344781; x=1786949581;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxNP1XVIU2h+ocn5N02vtGQLncr6TSEDgpCOcj0bI6U=;
        b=eUOUhppoRs6rWCthR7KEgbCQjPpiKFVHETt1DaxMS2cZSXl7cbmCVlS0T/yHk1Grqp
         DBnRPzLNz0tMs4BFTenRh72y1hlPz/CLiHppCUCs3tbXCh70+2nXnQSk270N3M32yeaQ
         DiSO0WFLd5zZEK1oxUpxjyXQ2/x8avNwFdpAzeypUAUMoTeqXxrQTIvzrFhsgRMrymQE
         Z3ONTVJ4+3lt1JNKD7eWAAABKfSCJ8cjibn+e8exc5UfBi7O0IC36mwRNwkYgpsslhGk
         Wv81lB0aDj3HvFzvoGbv45yoUelMFShekibU4J6EejGivlDT0+j4cOkFfQZ6HsEQfkKX
         Lumg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1tzvfF+6xL7wBRaMpIw0TGFHGNuW5INSJoabzqd5iRMtR04vVpkfrR8pppE3PrZjiZsEgz6i4KhJgG37o@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5qVzUcMEc7qrasPTicJTGPlEcsbNNCSWvQNVoeox07mMxvQGz
	y+fps4SJUN+qKvtD0UBzPEztJ7ge3QPXE7u22/YyChkG/GrqxSIWUONhm42KfrBa6kaDCeomjwd
	Xf935Dk1rTVScvSpOo1wu4QerJDOgDNHNHmQP2HwfHb7ETI5sWy+STP7FnEHVITFVwGyf
X-Gm-Gg: AR+sD13G5v0GnRAFNDq7kyjDdti8Q/qD1EgIiOgxYm/gvULA81Ohtxp6Ii4+gy+YgAV
	wNVtGRyWfAgIZ4IsE5VH2hmpRdHiFAApYTEZbaA1krbYscIvzwNvqfnnyTR6tCRrCYlxo/DRmt5
	RErOL/MndHe0JDqDcHgv0NSFzPouqhBg43VfjHYLlqZJyK5+fx2eNxlGKxecNP60Eu8bMeO81uL
	CJgqpsUKgEgts3GtFJEOOwZGUMuyC2VVaBFd3HDQj2Uprv/yqoxEySIjdLlEhoRRLKbtFE0+z99
	V1j9mT4vDR9wZsjfzQPSeB/K+rOh2us19P8a8IyBxK9AS+fTjziiKOFkYNtg6E5TrApH/YArOr1
	yflc/gGlDW4pr4yTjvVb4/mnJwHHTxf8i
X-Received: by 2002:a17:90b:1a92:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-392823bfc0emr15555058a91.13.1786344780427;
        Sun, 09 Aug 2026 23:53:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1a92:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-392823bfc0emr15555023a91.13.1786344779990;
        Sun, 09 Aug 2026 23:52:59 -0700 (PDT)
Received: from [10.218.33.218] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff6658bsm11333631a91.14.2026.08.09.23.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 23:52:59 -0700 (PDT)
Message-ID: <22638805-adfb-47ed-9fbc-425cb6f6874e@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 12:22:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dmaengine: qcom: gpi: Fix channel cleanup in unwind
 path
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
        Miaoqian Lin <linmq006@gmail.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803120316.2703956-1-aniket.randive@oss.qualcomm.com>
 <b4e092f8-a991-4028-ad24-983dacba7daf@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <b4e092f8-a991-4028-ad24-983dacba7daf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WbUBiBQTd3jtZ-VxdhfS1wQ-2Tmy0geJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfX3h5kCNF+mC7v
 edrLe79zsd6ep/Nnyt7lq051MqLtP8+T9eJ4u5bkhu5GMjQL3IIJ3XWc4WL1Utu4hEG8GoIUfgz
 nv7zrIMW9V4ASW91C1dync0PEbaMghENOVsJgbShEEnCNhre+rbUH9S0RbQ41XGKVMlBCgxljut
 D3ojTgnPwaXCEZQaeOYni0QEVHuCNudMtBfBhwE0uEQfsN0jcYK8hTP/6DvrvAStp1ta7UEbdkq
 kXMV5gUEVhUbXN3PZFdNdex6QJ8dTeL3T9VV4Gj7ddhuWMsBVFuAWZXtQ0N9cSuC5SSAweJMx0e
 Nmhy8rll3BrKWcCc5BPrAS806R4vKGI5rGyZyDFJnyfTZ2/4HhS8ASbR3E/GqoIYAW8W5DkAtt5
 zc4m1ANH6MxWs9VXHr6Sgtx7iPeOSaGxACUscFpRC8Yj+vkLp04QffuW8PFrDVwivIweQmpp/5x
 XJhdUW6kkG/LFpTmTpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfX6OWrnBNeD/nC
 QDn6gjGoBFHbQUMK0g3aTf7I0T6NbT5OkOckChokQua6GDp5RZCA2WvCB17ZHr4T3aKdKPh8QN9
 6g37m9GQAB5l7T82zQRflGiMiKYR3iQ=
X-Proofpoint-GUID: WbUBiBQTd3jtZ-VxdhfS1wQ-2Tmy0geJ
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a79754d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4-XsAOMHq4YBx5iLfxIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100057

Thanks Mukesh for the review.

I will update the commit message as per your suggestion.

Thanks,
Aniket

On 8/7/2026 5:10 PM, Mukesh Savaliya wrote:
> 
> 
> On 8/3/2026 5:33 PM, Aniket Randive wrote:
>> Fix three issues in the gpi_ch_init() error path.
>>
> start here mentioning  the three problems first in generic way.
>> Use the indexed channel in the error_start_chan and
>> error_alloc_chan unwind loops instead of the original gchan
>> pointer. Otherwise, each iteration operates on the same channel,
>> leaving sibling channels unreset and undeallocated on failure.
> 
> meaning, channel cleanup not happened ? make it simpler anyway.
>>
>> Clear pm_state after freeing the event ring in the error path.
>> gpi_alloc_ev_chan() sets pm_state to ACTIVE_STATE, but the error
>> path frees ev_ring without restoring pm_state. As a result,
>> gpi_free_chan_resources() may attempt to deallocate an already
>> freed event ring and issue a redundant EV_CMD_DEALLOC.
>>
> Looking at your change, it looks we are cleaning up gpii iterating over 
> each channel along with setting proper state.  Code seems simpler than 
> the commit log, so request you to simplify.
> 
>> Also free ch_ring in gpi_alloc_chan_resources() if gpi_ch_init()
>> fails. The ring is allocated before calling gpi_ch_init(), so a
>> failure leaves it leaked without this free.
>>
>> Fix all three issues by unwinding the correct channels, restoring
>> pm_state to DISABLE_STATE after freeing the event ring, and freeing
>> ch_ring on gpi_ch_init() failure.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/dma/qcom/gpi.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> 
> [...]
> 

