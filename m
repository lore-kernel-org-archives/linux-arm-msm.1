Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEAD294A10
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 02:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922082; cv=none; b=PGhb6UdS84amqJ6+eeqMM7kmxr8wGV633/Slk0Ct3OJq4HC/DEcF7PfDbeUeANflBmhHieKjuMNSss78FkP7cm2+N/+gUj0xiMeC1kJ5hsW+RYcDhW+GoXbLnhiKYrChG4CRbhHi/M1/F7M5c6s/zCAZ+2Cz88fC0JyJj0xY3Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922082; c=relaxed/simple;
	bh=9NyIx4dDN/n8SR7fgjVO6DYWyHiKLhy9HgV2Hm+621Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoF2DPICyfrmW4B4vSVHT8zmAdwviEspnmKy9cUDb+FIyUtv3ORBK0TWBrCDaWS+CnCjgs46wvN2zFO7bir34GNJ0+VhJ07HVW1S7jPT/0jVkF1S9Po1M+C1lHdsnZcz24di0cN/c7vvSyMdwNlspB3d0LwVNsdMFYIddeQYssA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBHm0GR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAjbkR/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBHm0GR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAjbkR/8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6892aBQR1189432
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 02:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rjawb3C4arzargqScoKB4y4HXxny+HjzJB7ieKfMXLw=; b=pBHm0GR+622PlG7b
	FbCGqFHORCQwXcFHadDDYpB3bXSwHTrcEWARIaGtNfW/+sqcsEvt8KE4CViI/Axl
	xzsRN/a714PJOPUckdwHfObcuRgUzTq6Jc82NfVZK0fWHL1bXPJDUJadoaGcJRXL
	0fRWARHsqKMDmB2wn3Hp2R/g+Kyp1sXLeN8I7q1AIhlcfKVS03/1v7LqWT0LhrVz
	oeU9Cpzfqkkxi497nKjZfXM0H4h3QhLX8HH3NRPSwHBnUWNN9VaQ9k6LTMfxuJuh
	LRrGge5NFCUPC7c3r7QC0FNpjiPLNc3b4CkqUvFJz/i714zTBKbhkCfAqyZLK/3T
	zE8XuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxtm019s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 02:47:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so9633007a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 19:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788922079; x=1789526879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rjawb3C4arzargqScoKB4y4HXxny+HjzJB7ieKfMXLw=;
        b=PAjbkR/89P6iNRitLeJijBOb+X21MmuMOBT49tENkjOX0tK0lshdynC6FtTOubUM55
         NX25L9RznSXit9Y8+yyJkC7XERNhBVS3qFxr4+GKq5DC8dFUibe21TPig1B4Gx0S/Iqj
         r4CdS1z/NS074SfaZx6O1IfEEBV4IXzRVA4FSqfV27RJrv1hQpoL96EzExRdno7v9j1w
         phOmqsWQEFHS9kRFMqRMczCQfWxFzENgEVNilyi4wD+50PKvBmcrpphN18MMRaMMyWPc
         9J4wYbCRqm1a+UdLl4nKHcYeIeAcbYQsRwYymcNqydqZnvK7nY5ZeTAWv+gb5uY/mmeM
         2E7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788922079; x=1789526879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rjawb3C4arzargqScoKB4y4HXxny+HjzJB7ieKfMXLw=;
        b=YCNtegEmlSLMoUGhGd9besQLcz493D/M8AdwNar3oYH11npoMq+yP+wlFaS0E6NosN
         RP9W48jrUiWosFaSr5RsV0LcXFTdPkajoFqM0FT1gs97Xjx3GbGnvApAAPkUTy6Pzspj
         9qUyWDcO4ddzbQyzLlp3QP9xgoL7vW5wPbU0EUaUBJKpVl9KdF4cCmQnkGVM+hgV4GxK
         9vSPcdMofLuYyk+5mjbwUdGewU5m+nbkuABUcTjORwKR0OQkrU1V6A+e8+P+Dk96K/s6
         4LfQlTQMcVPitPkBYfoBsInx6SvisaZuNi9y67uJY6ABJhSq7Mj40bZI6fuhhJroyESg
         Bklw==
X-Forwarded-Encrypted: i=1; AKwUvBwEFrNU6qwk/4QjJYU6rSJupEieCvJyOx0EJKsc5Bjr//umI1H0QBVzJ/9TBpRVnxGjsgCVDUdqeas2H23S@vger.kernel.org
X-Gm-Message-State: AFuF++lFWiHSwj5DUJapeSf7cnPK0UqW4U/uEeyZuPAs26maouk6dnob
	V+CsrPQUK3WsUI1ZYAGrpNQFati0X9L1y3S9+tu/Iwos6gtF4mU/B0GPE7iVPuGVspR8oJCPTh/
	QAVpna7Q4QW2I27062NUqCL9A2yiCqnbsLWapm526QatYSwiOdrHHr0SF/XIZGun7sqSq+XwOwM
	i3
X-Gm-Gg: AYBFou3wxYh9WzasN+PJBTOlUzYvPQsmr8kcAdlTXLr/SmbrFkUjfySzh8CS1Srkl/L
	MLiF4BJgcVp9qzYXL7Uim4T1XcxeHOGky3f2XRZaaZHFvYWo9xqeHC2Nh1U0FSMemdligjp6Vvr
	+5A1HsGsjzOcj8FgDC4qM2K5QVo7pQEQeXGveW4pTrerJWb5927uwR8T+cp1Do++N0YsOEAECXy
	QNHcu+LSrDPUNYcLP5Ji0+JhAWTtNIK14x0j78tnSWAJvKhI0JytSk+vbxNrZFQ30lksD4rQmQl
	spv8VaTUnUX8QmRkfEYr4MslScFrCStnyva99VRSVquOVl264l86nDTllRwHetl696s9t4Sp2FR
	4j7+XK/ISF9oyJFGEZTNYbw6eNi1J
X-Received: by 2002:a17:90b:2d83:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39bac1976camr4182189a91.6.1788922077934;
        Tue, 08 Sep 2026 19:47:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2d83:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39bac1976camr4182167a91.6.1788922077384;
        Tue, 08 Sep 2026 19:47:57 -0700 (PDT)
Received: from [192.168.29.58] ([49.37.154.50])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm37033346c88.11.2026.09.08.19.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 19:47:56 -0700 (PDT)
Message-ID: <0f910397-f38c-4f14-894f-6b0f579a4d9a@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 08:17:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] scsi: ufs: ufs-qcom: Enable only lane clocks in lane
 clock APIs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260713173434.883386-1-nitin.rawat@oss.qualcomm.com>
 <f9abba69-7b0a-49f3-bd83-b38a7a451cd8@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <f9abba69-7b0a-49f3-bd83-b38a7a451cd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAzMCBTYWx0ZWRfX/wzjJC/NYjlY
 qkwH7f92DohkcK4II4faLlrTeiB4R8P7BBRfLf9+nHbAxz/1mN+WK2+1k+AqY+CChYc0YskVgvL
 R5kHyXXUAOLhmAHvh2edsl3yDfAZNUE=
X-Proofpoint-GUID: h1IQFzQrcWKjOxVYld9nd8MXGDEhOddH
X-Authority-Analysis: v=2.4 cv=F+1nsKhN c=1 sm=1 tr=0 ts=6aa0c8df cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=FrNG0DaaYUTAIW4lgu81OA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZbYmq58Ac-c8yyNXGIYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: h1IQFzQrcWKjOxVYld9nd8MXGDEhOddH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAzMCBTYWx0ZWRfX9KYfmsr29fxN
 WL6JVTL/NWgfk6TeFlYdG7RxnMW6Y8PXj71NdfOUJHbLoYaf2Q7MCcgZ9OK1Fp1361mkajfZHoj
 3jl4bnCgGxpG/sMky2dIWc6hiYRG7G24uNbxxfV4qmQYX22lune9yL6lIAWt20NIgmXqYsEmohk
 NOBWlR0epWDaN1K9ht9uCveQgMNH7zUzjyS5m5CwVvu3s8mDAJoxFvRnDly9YA7OD3t48BsTJYt
 pLbnmZbHPi6IgTb5E6t92OptPpaDX+f24A8Cg8rFAkIpztFuFAEnGIiAnPs0aYe1Eeda7y6iq2m
 O0xdixJ6FYbUG6y4cYeHDMlM6wwi7r6PQ/Gu6ugSPpgJtG5tPJPWFz1kQOc8V61jKoqz/cfsOCo
 E1w+ZUyHvoyEj1wW7lLShKCHwmrDDxjPC/3Mfvg9g10jMKIaElWYezbOZ2QIytFuod1zgdPjSlD
 zD/IIDL7xv3nntndvnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090030



On 7/14/2026 12:41 PM, Konrad Dybcio wrote:
> On 7/13/26 7:34 PM, Nitin Rawat wrote:
>> ufs_qcom_enable_lane_clks() and ufs_qcom_disable_lane_clks() currently
>> use clk_bulk_prepare_enable()/clk_bulk_disable_unprepare() on the
>> entire host->clks array obtained from devm_clk_bulk_get_all(). This
>> array contains all device clocks, not just lane symbol clocks.
>>
>> Since the UFS core framework already manages the non-lane clocks via
>> the setup_clocks callback, the bulk enable/disable in the lane clock
>> APIs resulted in duplicate reference count increments on those shared
>> clocks. The extra enable counts were never balanced by a corresponding
>> disable from the framework's clock gating path, preventing the clock
>> reference counts from reaching zero and ultimately blocking CXO
>> shutdown during low-power states.
>>
>> Fix this by restricting the lane clock APIs to only prepare/enable
>> and disable/unprepare the three lane symbol clocks (tx_lane0_sync_clk,
>> rx_lane0_sync_clk, rx_lane1_sync_clk), leaving the handling of all
>> other clocks to the UFS core framewore.

Apologies for the delayed response. Reviving this thread.


>>
>> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 41 ++++++++++++++++++++++++++++++++-----
>>   drivers/ufs/host/ufs-qcom.h |  3 +++
>>   2 files changed, 39 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 291c43448764..7ec1626704c6 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -347,7 +347,9 @@ static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
>>   	if (!host->is_lane_clks_enabled)
>>   		return;
>>
>> -	clk_bulk_disable_unprepare(host->num_clks, host->clks);
>> +	clk_disable_unprepare(host->rx_lane1_sync_clk);
>> +	clk_disable_unprepare(host->rx_lane0_sync_clk);
>> +	clk_disable_unprepare(host->tx_lane0_sync_clk);
> 
> I don't know if this matters (probably not since IIUC the controller
> would be suspended already), but downstream disables them in the
> following order:
> 
> TX_L1
> TX_L0
> RX_L1
> RX_L0

Yes, order shouldn't matter as controller is in suspend state.

> 
>>
>>   	host->is_lane_clks_enabled = false;
>>   }
>> @@ -356,18 +358,35 @@ static int ufs_qcom_enable_lane_clks(struct ufs_qcom_host *host)
>>   {
>>   	int err;
>>
>> -	err = clk_bulk_prepare_enable(host->num_clks, host->clks);
>> +	if (host->is_lane_clks_enabled)
>> +		return 0;
>> +
>> +	err = clk_prepare_enable(host->tx_lane0_sync_clk);
>>   	if (err)
>> -		return err;
>> +		goto out;
>>
>> -	host->is_lane_clks_enabled = true;
>> +	err = clk_prepare_enable(host->rx_lane0_sync_clk);
>> +	if (err)
>> +		goto out_disable_tx_lane0;
>> +
>> +	err = clk_prepare_enable(host->rx_lane1_sync_clk);
>> +	if (err)
>> +		goto out_disable_rx_lane0;
>>
>> +	host->is_lane_clks_enabled = true;
>>   	return 0;
> 
> Let's keep the \n above return
Sure, will take care in next patchset.
> 
>> +
>> +out_disable_rx_lane0:
>> +	clk_disable_unprepare(host->rx_lane0_sync_clk);
>> +out_disable_tx_lane0:
>> +	clk_disable_unprepare(host->tx_lane0_sync_clk);
>> +out:
>> +	return err;
>>   }
>>
>>   static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
>>   {
>> -	int err;
>> +	int err, i;
>>   	struct device *dev = host->hba->dev;
>>
>>   	if (has_acpi_companion(dev))
>> @@ -379,6 +398,18 @@ static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
>>
>>   	host->num_clks = err;
>>
>> +	for (i = 0; i < host->num_clks; i++) {
>> +		if (!host->clks[i].id)
>> +			continue;
>> +		if (!strcmp(host->clks[i].id, "tx_lane0_sync_clk"))
>> +			host->tx_lane0_sync_clk = host->clks[i].clk;
>> +		else if (!strcmp(host->clks[i].id, "rx_lane0_sync_clk"))
>> +			host->rx_lane0_sync_clk = host->clks[i].clk;
>> +		else if (!strcmp(host->clks[i].id, "rx_lane1_sync_clk"))
>> +			if (host->hba->lanes_per_direction > 1)
>> +				host->rx_lane1_sync_clk = host->clks[i].clk;
>> +	}
> 
> This is technically probably a little faster than calling
> clk_get() again, but please do that instead

Sure, will take care in next patchset.

> 
> Konrad

