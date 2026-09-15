Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9516141BA7A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467086; cv=none; b=HwoeyHtsCMxmEEiH4USd8JkCHYU6EhQvEiKIVzZmAPtmki88LXrJ09QJ3PouEU/G54Sas97fk4GquguuFjt/2GjekoDowXIM0VovM+v86PLCfe7JFbiX8ejv2EbwSFaoPmsNtiT37meLfPnwRv1iw0DMBsFb5ffS7vguVLp1jeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467086; c=relaxed/simple;
	bh=3A11Je4xZf8841M0gdOA4/nlkkErzXWi3HPLVU0/0LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTbkV8X+xJbzt/ML13vY5D67Kyoczf/s5XNdNNKnP/O/ma5jxSLXR1mTiwFrWs7++Op1sr3uvwqnNs0LD/uOU4umNd0zpGZMLNwyuYbyoyp30XC/pNTvvDC2H2DQuEFZdq6+WhPu6J1BYPEuVq0nKLI3SHZVjzfgYrVsmsunwEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RXY3VjgZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RXY3VjgZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da9so399218f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789467083; x=1790071883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mkp4/wKZXD3uenxBisrMtNjucgS6f3bitOkqBmF1Axo=;
        b=RXY3VjgZAxCywUcerRzduigoU9FEPtq2dRj2RTVTA/26g80xN3paC1V+NUq4HY/6kv
         pBKUCza/DP13Q3RY15BlCrhK5a5K3XGLVRemm+Hen3TajhH6MMSKLrtY4D8xVo8LOyc+
         ZOYXYmmfiny3fd1ughPzmjxbAjjRoPwNScXwu8gAgUgOohYp30d3Wg/+mwKryp/r1+6Y
         y9nO8vCuFWcY5ep5++7P+7R5ParuSo2UewidF8p71bxxOQwFkrXNpF5AoPD9XlhRS7zO
         WZnG38c07s0VvOPpPU6h71fT974XBwCzCOBw9TWsZWH/yaARnFXDJLryVk3MKbgCZb5H
         Ay+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467083; x=1790071883;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mkp4/wKZXD3uenxBisrMtNjucgS6f3bitOkqBmF1Axo=;
        b=TkU6o+Fqzsqq0I6aZVuDCIZjE9afkkLESbwnuWyLhGPA80g2959H3phS+5xZnbWIgh
         Mpo+rN9XNbfS8pp/+mg7vjPTReZAol7kO84DKgJseN3bG/WQZDhGQdYwmnFrZJV7U0gB
         7Cxgj1beKEVt+ipZmT0Vzota5Fr61fGZJTR+ataneCRvwt3QxSP+36lDo0cjZ/NasxfF
         iF1+aqWPirax2mPzqEyTUdW3p94m1Wyz93cBl7PA6qUD4p3gWAQ44tuZvI9wOLvfsJL7
         jV2/FqlX0P3mOZGk2UTV808hUFw87cbb4BDgGBpi2t29G8F9zkqNHdVwc9WOELw4hXNQ
         lytw==
X-Forwarded-Encrypted: i=1; AKwUvBwjJ9uW76XVVToZmOVg+t0NpAe95Uv1LYlsxIILpsW2i/atKhELgUugvdc2CxMMtd4AgqhFGgLg8ON3u7+T@vger.kernel.org
X-Gm-Message-State: AFuF++khysLoKNDqNoL2RwFdG78PqgyQag8kI3qysBJsu7LAHuH8YAIt
	aNjt1DWel8r3sYsGJ+YZMhjGnKM0Nx/D5Mh6DC1/ts6n6ID7LE36/fmO3i3QQBEqMWc=
X-Gm-Gg: AYBFou0o8zhpbAm7+ZtYKCvzsBNcAtqB8fL77R4EaYhzHlGuZe7GZ4EEz3OUkmZe2No
	oiLmurGUh3E6UKef7tL9HIC9agz6tUQtl0yFhJl8jQk2OcokSD+Jmp3adqWX+LVh3pFYtbifXaI
	1Vq8C6uFlLYCM9DlaVqbfCeNrXkZtoyctDLcIo1A2f5fj1U5qAOiQZVzwdrBlvLTeU1/5Mr6w0/
	0F0l1ODi/Byl4KkOFN9jta4I1LdGPGDSRgTPbtmo5R9EWfL++iPlbY3sYpZo2c4MHr/fzuugHUW
	3JEGb02ELtZQV/xPqleAi2D1O4oyz7foxhnJVY5X5zKsgZWP1V3DrLpHpio9CfFoFRIVtrRKt6I
	YIWdJLzuVY+Q2b+o+G1XxgTDpsfzv8Uf3pLJ61nbTM55CXSEwr3b6h8cAvfDQoJUt/h/hsWAJUH
	rXZIm6cATSQmzZGsC34YThvOa5tTYQoizrF6Uy2xOXy0iaSqB58khGG3hJHP0w7V5RsA==
X-Received: by 2002:a05:600c:4e53:b0:49c:ff81:e062 with SMTP id 5b1f17b1804b1-49e7a68b774mr72695915e9.2.1789467081857;
        Tue, 15 Sep 2026 03:11:21 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903::e14? ([2001:1a48:8:903::e14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d695677sm60344685e9.5.2026.09.15.03.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:11:21 -0700 (PDT)
Message-ID: <ab1491bb-cca5-4145-ac7d-31c966abf7b4@suse.com>
Date: Tue, 15 Sep 2026 12:11:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Daniel J Blueman <daniel@quora.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Chris Lew <christopher.lew@oss.qualcomm.com>,
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Takashi Iwai <tiwai@suse.de>
References: <20260909055846.16539-1-daniel@quora.org>
 <260eee02-29d3-478f-9a39-d67adfefe862@leemhuis.info>
From: Vlastimil Babka <vbabka@suse.com>
Autocrypt: addr=vbabka@suse.com; keydata=
 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
 pYekxJujNeEDkUlky0Y=
In-Reply-To: <260eee02-29d3-478f-9a39-d67adfefe862@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 11:04, Thorsten Leemhuis wrote:
> On 9/9/26 07:58, Daniel J Blueman wrote:
>> Since the MHI HELLO exchange was relocated, it is sent only at device
>> registration. During a suspend-resume cycle, the firmware in WiFi
>> cards such as WCN7850 indefinitely waits for another HELLO,
>> triggering:
>> 
>>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
>> 
>> Fix this by triggering the handshake from resume_early in the MHI
>> transport.
>> 
>> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
>> suspend-resume cycles.
> 
> For the record: Takashi ran into this regression as well and provided a
> different fix, but withdrew it after I pointed out this fix, which
> worked for Takashi. For details see:
> https://lore.kernel.org/all/87mrtkpd2q.wl-tiwai@suse.de/

Thanks to Thorsten pointing me there I skipped the bisect and applied this
patch instead and it works.

My laptop is T14s AMD Gen3 with ath11k_pci. Since rc2 the wifi would stop
working on suspend/resume, making the resume freeze for a while (I initially
thought it was frozen completely and was shutting off the laptop).

Interestingly the card doesn't recover after reboot, but only after a full
power off/on cycle. But if the HELLO handshake is sent after a boot,
shouldn't it recover? Maybe the hardware gets too confused to recover.
Dunno. Hm maybe I can try if 7.2 kernel (and/or 7.3 with this patch)
recovers it without poweroff/on after a 7.3 without this patch
suspend/resume wedges it.

But anyway this prevents the suspend/resume issue for me from happening in
the first place on 7.3-rc3, so:

Tested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> 
> Ciao, Thorsten
>> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>> ---
>>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>>  net/qrtr/mhi.c     | 10 +++++++++-
>>  net/qrtr/qrtr.h    |  2 ++
>>  3 files changed, 24 insertions(+), 1 deletion(-)
>> 
>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>> index 78347c937af7..2ffcfc2fdb4a 100644
>> --- a/net/qrtr/af_qrtr.c
>> +++ b/net/qrtr/af_qrtr.c
>> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>>  	qrtr_port_put(ctrl);
>>  }
>>  
>> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
>> +void qrtr_endpoint_hello(struct qrtr_endpoint *ep)
>> +{
>> +	struct qrtr_node *node = ep->node;
>> +
>> +	mutex_lock(&node->ep_lock);
>> +	node->hello_sent = false;
>> +	mutex_unlock(&node->ep_lock);
>> +
>> +	schedule_delayed_work(&node->say_hello, 0);
>> +}
>> +EXPORT_SYMBOL_GPL(qrtr_endpoint_hello);
>> +
>>  /**
>>   * qrtr_endpoint_register() - register a new endpoint
>>   * @ep: endpoint to register
>> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
>> index 3990da1a65dc..50326ffa3401 100644
>> --- a/net/qrtr/mhi.c
>> +++ b/net/qrtr/mhi.c
>> @@ -183,6 +183,7 @@ static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
>>  static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
>>  {
>>  	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
>> +	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
>>  	enum mhi_state state;
>>  	int rc;
>>  
>> @@ -201,7 +201,13 @@ static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
>>  		return rc;
>>  	}
>>  
>> -	return qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
>> +	rc = qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
>> +	if (rc)
>> +		return rc;
>> +
>> +	qrtr_endpoint_hello(&qdev->ep);
>> +
>> +	return 0;
>>  }
>>  
>>  static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
>> diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
>> index 3f2d28696062..de2de69a6199 100644
>> --- a/net/qrtr/qrtr.h
>> +++ b/net/qrtr/qrtr.h
>> @@ -27,6 +27,8 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid);
>>  
>>  void qrtr_endpoint_unregister(struct qrtr_endpoint *ep);
>>  
>> +void qrtr_endpoint_hello(struct qrtr_endpoint *ep);
>> +
>>  int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len);
>>  
>>  int qrtr_ns_init(void);

