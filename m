Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC73C6A38
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787639356; cv=none; b=ot6p2LCY0Jj1NlG6L2nWvzZW3NLmLMhFCDJ/CtboqLwtPosOzbIDl5yzWrK/wFn1aOfJ8Z3GfZqS9P2SnqV8ncy8zpnYHlZ1diw6g/zGtm40GOMHOHBBY5ong9ywrtMZOtDc4xWSGzVgvqoeTHIqpyYMGhK12yI4dcaqU1drIrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787639356; c=relaxed/simple;
	bh=T5aV1bKmohpZ+aNSqdq7/26Tikkok1QjUqElY4u5bv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1+xIHWv6uDd7cCyxbK6owvAQUDKP3YbZ7f9UBw1W/u3eyyYnkGyLdSoYKNnbMS4wqFA4j83XQdU8oyv/dOed5X1+d/sCgVrs68FdTbh807Tp+djH5lsUc+pM1AHZSWkPXTkOEnVJAtpcIPshyaMhcT2Ql1KB93Us467Q1C+6cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UiTHo5y1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4ONZMqD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UiTHo5y1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4ONZMqD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P3vmVP1149158
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5BlCQjUficUb6+P36Gle/9S6qFrgRnf0A65vTV0iuY=; b=UiTHo5y1lbB64WL3
	fwQywIod+yVa8ZONG/lsCSFeejYySG7KXE42GbAdytNjpDntGQkflG3hYOgbK8SO
	ox7SsD8lVZ5c2gTGIHv/MhNpp2gS3Ek40cMDbvRJg4a+L45ar/o7bE1LV8CITj7d
	XNx+ZMZu5JIbVtyLmXmwxRUTVQQkYuHi1ytNK/jESbjTPLlrJxmJm+nCcw956VD0
	JqtZWzeGjgfQh3OA68rgPutMxyfAhjBJqxNxnPbTSkSeSNOaxJkidPpUjNTXOKPy
	6W4OsWxb71XMQEgmusSfetcvPv0LF9jYLqrnj3K3HYWgmetl6dEbQ99SKA8r+M80
	OCFNMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvrevv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:29:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so46046445ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787639353; x=1788244153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5BlCQjUficUb6+P36Gle/9S6qFrgRnf0A65vTV0iuY=;
        b=I4ONZMqDSxOOapccqpZxjVgdHdzmHV6F0W1047TWrgsVh65XANChdQOMvIG4Mcpl2u
         saqjMglc4iS/jio8/QmQCq3SsBEPcsw6a0Mlesc+XTabtA8qVIQR0Yj7BchD/epbATOP
         Uyj+So0kGB8wJJoUjFJ1e8t4GhCLCNllYnx1mWvNHBV7o2KWGdsjLcQ2KnjfZv77mzj/
         7gGepyKzwjErrIo7HbznivMof8Jmq3iclXQA5ZS/oCU1bmj4M2VnMVhvgsOGkkI0S9zD
         7gvJ1bx9yvuqR0Rr3WVCospfLDv+JgdOq9Z+VV+B4mbaXXuSvlLmivnzzJVmVxPM8d/X
         Ym6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787639353; x=1788244153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5BlCQjUficUb6+P36Gle/9S6qFrgRnf0A65vTV0iuY=;
        b=VCZEg5cZwlr50Esk9L9NRrxLw+dn1vymBX5OIWwnqYu2SG74VKTkSdW0gwbLPN+m26
         Td4TGnVbxLmMDJra7flq1JLW6sK74ntuepV4EZuZjzi74csGCQt3HNnDlgH40F0hz4Lg
         iC9gzUptLrIfjtidc3FnV/ng/rOgEUq0zCv62reiZ6OD3gH4eQS085V87dqNlo/O4xov
         cPCDhhmTr8MHLDDSEa2okwg40dSZxuFUhQTrQSQOcDOtiP3wk2RxMe/zh4mDTTLqznn1
         lCV0Vpowxryo0q3sKjdGoIh022xpbUNxtAohJrP9o75bUeQ5+M5wt+mIZlkXpqmIFwIt
         q8vw==
X-Forwarded-Encrypted: i=1; AHgh+RrvAX+soBQJlDsZIXabtRaCahDX0FTxhzI7XEd5FKbJmu8AO57c3iwe3QOfMvzx5l1R2GpKMkO995A9OIRz@vger.kernel.org
X-Gm-Message-State: AFuF++lHnPyMu7sYKJxQxyqQOUegRmupLGtDMxplLoj5g7wCgVD62dsH
	ROHunSES23l80LQhGeZtXNAWRD9fcAgRdm8DgF83Ld1Dd+NP96hDNy/oBiFZbcS7pOyQmwiLDQr
	C8/Vjq6sj6snoS9omrJa8cUJtCZVlbtHmAJhx4MwOOwCyrTw1grxisFYqyaLlxqQig0Ih
X-Gm-Gg: AR+sD10ftJHuK+/y7jVvY/Tukqkj0nsgtqDvmWUR2iOX0fMC2RqM9iLosfiCfqMwOWS
	xInXq9VcGrUH7zue8/eeKoITVrNq1QTRU53euxcwimNDUNq6Bld/3tSludmIUGEZYzkJ37xWuJb
	OyFsp2Rrm9fUcc/wUpJSGT32q+L8p6XNcNBP0GZUyrinlJIn6EQrSMR0ApW0xCeTcxI+Ls1dqVG
	pu5yjy08p/gj95AUmfP5JnRlpYQmQLbXQV8V+p57HGSBeQwgvloZSLqd31E/Kw1Qi6ThoCTqHlm
	18YpO5Kc7d/Mogos4Rd0CDgNNIhTmVoZNEOMyLDC3zoZWOOFCK4THd1VAS9HEZBW5k4qRHz2Ave
	PFdT8jd/OruHmi81AXYXW25ZAg4SILHcBGUXGjNSZZ9BA45ro6RQu0dP5PogPwyBYHb/yJkav
X-Received: by 2002:a17:903:4687:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d6dca619a1mr88911785ad.1.1787639352647;
        Mon, 24 Aug 2026 23:29:12 -0700 (PDT)
X-Received: by 2002:a17:903:4687:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d6dca619a1mr88910725ad.1.1787639352192;
        Mon, 24 Aug 2026 23:29:12 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768b9e3dsm24218565ad.65.2026.08.24.23.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 23:29:11 -0700 (PDT)
Message-ID: <73722056-4f15-4043-9005-c033dc8986f8@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 14:29:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 25/25] drm/msm/dp: add HPD callback for dp MST
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-25-2ed6aee1867a@oss.qualcomm.com>
 <remaj6npgiv2hakdeevj5mp76c46xupoa64dqbp7x37wlzgrca@66ooracpci4x>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <remaj6npgiv2hakdeevj5mp76c46xupoa64dqbp7x37wlzgrca@66ooracpci4x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1MyBTYWx0ZWRfX0RJqDTFOmldt
 U50kIJlXzD9yzjCv92R8V3uRpZG/muohWSsIC4UimU/pAKuqIK6CKxkLRVb9uQDXF+vq1STqvMA
 sm9kkETwPVKkiQqZkYxmany6w/4RI0jdjdxxdQmcel3Br2fdqzC56CiT5+t4551BSczzQT4cCpP
 nvqcpyd7gzeOM47kTuQlOD/TiysLaaMHzlmreD/XSWXntPG4H0MgfpAzhMzIzn2eiyIOnbSCLuE
 DFiufsB1Agx7Todi3G0NVsgp2bw8/fHKgKedLdD+xpnykN5v2g9ry8rqsNvXN3XB9Gw8EiJPPjy
 xj+X/L+Iqxr6s7Hw1Jw1X71yqpXRJDUai5QGBZvaTKSA1i1/ytr/h08R0Ny+d84gQ+FnzqNtXSz
 JAq45FsheEr8WVpvaGQvrZx6A1X0P2QC/sAWTeeYZ3pkL6W6ZXCVRVJjV/vKNeHE/EQHv8J7AOu
 Xha9lynWIM+kZIZRf5g==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d3639 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6gsoYQu_toBURm7Jz6AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1MyBTYWx0ZWRfX9juiK3PlYPRp
 8qp1maExqDl8wd8w9HPCH/KA1zSD2YHsiMQxhOnGYdAaRZvhs7Gn2PkIcza5c/PFl6598jwS2YH
 CS1RnomM84H3LVuFywrKYxP2VRZJY/k=
X-Proofpoint-ORIG-GUID: bgd2X54aU7Zpptp3_JUVjTtC40ye2zpF
X-Proofpoint-GUID: bgd2X54aU7Zpptp3_JUVjTtC40ye2zpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250053



On 7/13/2026 8:54 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:46PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add HPD callback for the MST module which shall be invoked from the
>> dp_display's HPD handler to perform MST specific operations in case
>> of HPD. In MST case, route the HPD messages to MST module.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++++----
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 46 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>>   3 files changed, 65 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 6eac390af2e0..49a7bc5e031e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -455,6 +455,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>>   			dp->msm_dp_display.connector_type,
>>   			dp->link->sink_count);
>>   
>> +	if (dp->plugged && dp->msm_dp_display.mst_active)
>> +		return 0;
> 
> Why?
> 
We need to filter out unnecessary plug events. A single physical HPD 
event may result in multiple hpd_notify() calls. The first call comes 
from the actual IRQ, while subsequent hotplug processing may trigger 
connector re-detection, which in turn causes additional hpd_notify() calls.
>> +
>>   	guard(mutex)(&dp->plugged_lock);
>>   
>>   	ret = pm_runtime_resume_and_get(&pdev->dev);
>> @@ -550,12 +553,18 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
>>   {
>>   	u32 sink_request;
>>   	int rc = 0;
>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>   
>>   	/* irq_hpd can happen at either connected or disconnected state */
>>   	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
>>   			dp->msm_dp_display.connector_type,
>>   			dp->link->sink_count);
>>   
>> +	if (msm_dp_display->mst_active) {
>> +		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> 
> This should be routed through the HPD / notifications API so that there
> is always a single path for handling the IRQ_HPD interrupts.
> 
Got it. The reason for having two paths in the native DP case today is 
that the current DRM IRQ API may result in unnecessary hotplug 
notifications.

Once the API adaptation is completed, both native DP and Type-C DP are 
expected to use the same IRQ handling path.
>> +		return 0;
>> +	}
>> +
>>   	/* check for any test request issued by sink */
>>   	rc = msm_dp_link_process_request(dp->link);
>>   	if (!rc) {
>> @@ -1111,9 +1120,13 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>   				      connector_status_connected);
>>   
>>   	/* Send HPD as connected and distinguish it in the notifier */
>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>> -		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>> -				      connector_status_connected);
>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>> +		if (dp->msm_dp_display.mst_active)
> 
> Locking? What if MST is being enabled or disabled on the other core?
> 
In the future, we plan to switch this over to the DRM IRQ API. At that 
point, SST and MST will no longer be handled through separate paths, so 
this issue should naturally disappear.
>> +			msm_dp_irq_hpd_handle(dp);
>> +		else
>> +			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>> +					      connector_status_connected);
>> +	}
>>   
>>   	ret = IRQ_HANDLED;
>>   
> 

