Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815303;
	b=bz07HszGKhXTfqXS+j40fKsmC0zLOui0h0v5V/Qdkd6jwg2r4MGtDYj2ABvLLjv2Ck+p
	 6Yf88Whnu1Pr7ypixVP+TTBXVvzakc/T2uHREuTvOFLigZHgpHAyggnFIQOnyWazbpbe+
	 rLhAgq0gom+xP/pAu1u6eeOaZDs2r+6VXfKwqdxtUFqsf1x/S7MjeL378vhqkBsG02OME
	 CaFmTVqvACBmdx5U6cBkkyqYRDIBNz3JDkBHCLYfuvStmFm8Os6EhrTdEhDIS47cF8qLL
	 XwpGJlp91K2G6TNNJ5I2IB4HFWWs734JK0Ai1cu7Iup1Xy/FATnn7/2JFTcTMxS+R8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=;
	b=dWohGOW92XZtm9jcbPuloEN0/JxnOgdSFdzKG5dfhjdIks77Pdbdmxeu5/mZFwsEaCA7
	 89AC/EFEcdHfp18agOdCE5YkL+Pl0JPjAP5D5ZfAZGzxYKiHY59ruYFjcvwZF8nO+sa3f
	 RRZNk9HXhHdgT5lfJKpXbC64/JO1GWJV2ZbzYTNeZgy0RGwoieaw+pWNzPO76zSiqFQUs
	 Ie6WW5rI1wB/LT749n8uXCiUMXGTC6pfcbyIWGG8f/mvgT/hQXdu4xmrjCRtUlHvLuLb7
	 V/NbvtJ5VRUCW8d3se5r+d7N4twNgIJvzt8vAEorFinrHJS6l7z9q3hRYgJN9mFFfSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkM10zgx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QH2LcNPU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5478606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5478606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fkM10zgx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QH2LcNPU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7esUm524906
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=; b=fkM10zgxBcivPLtZ
	wRyCEo6iKmL35cEIZXHB1ARHguiqNFBWF1bsYdASwHb5PiS+bgacwG1gXaFq6//1
	kcq6kvbPZrTbtkWGId2MQyBGYE4N6xR28eQaQyUIlvQIJoq52tjwOH+qEISkVb7x
	gOnWkHFxvKe0i2WpgvgqAr3uCl5/DbV5BGusp4MEPGBKGe5IsFexLeCMuS37OOWw
	IFv6oiPCftpvZj9v/QaYS70oe+d4Tk0yyw7y4CMgeIWj8SISH7WqPr9PDHrgMHbe
	3ksEHTxtoGhZXyY/XinY34nDP1vXoqFRZK792U7cO6VWSpzHEe1S+NIH1c7pSUcz
	m9xH6w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqnh1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:48:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065e2933fso4371134b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 23:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794815301; x=1795420101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=;
        b=QH2LcNPUxj07MeH9HFrX8mO0tA9t5fuobfUrjSxKYtWAsSWIqRmnKgKZcrvIPCNXFC
         GuX1Bl6D6wmSCCWxlXPeVApMTPqH7JSgoPk3r2qQkfxROvZpM2bHQlMo0XTI6+S+hcov
         G0ZTHGpnjwUZj6HEGG7glX0Yvy9wvM5xZlmF9gm/h/451FWhz2TeYJ1/7tC/620rMWxM
         FKU5DFT/dmopWpC/pbAZXmWaEbIT+riVP7jGh32/2M8hzI6MeL6oacfCXP8vlmXcVZi1
         MblMQtrii9MQwiKzrGPY1us4uFwtzy9BYLi/INvm6CnkQxd1aEP6lApdIGgFX7Va3ODD
         7+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815301; x=1795420101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGNFYATSTRk0m4sDibX1E1epOFieqLBD3Mxm7XMYiAo=;
        b=ABDzGJKPODEyAvINkMkSNQo7MUHJjZeqXxWlGw+TBMHDhNUSK1LgJ9pQU/ep33aKHV
         xV3+W09L5sZmEBVozZ/6Uf0Vzgpi3N8iv6cvJmM8fMDD39OKAOir7FfbGfLKOVZ8y0l7
         g9BwNIYZNK5Sm03pjiUmWAyafIwM6liEdSNOKqQFNfwsTZ2geLpHpWyEjl4DyPEnX3xk
         8CRqrX3sL0UEWhogokP+Bq4K/jbxxzElPFMUt407fI0P3q6KpOUyz6pKOybda2XRjwKH
         VurIDcEwcIaUlc2DTXrurWiRvvGT9VMDHRwcsn5l0l2uNt04jz5upadQGqo9lKCbgsjd
         NXNA==
X-Forwarded-Encrypted: i=1; AL+hErFHN73FFMq7oUQn+m0R/DgEZ7gngVHS/4WKa6Be6fwnF34yqH63DVfWCoVAPf7NsF7y2ztUNdhYunC+Lo/I@vger.kernel.org
X-Gm-Message-State: APuU4Z+2ZA3gghowl3DluHWQisNOdUvDXxVf8kBh9mJuPwY3Myhomp4u
	rJtHLNxdoEvCK6V01UiqCNObO2sGIAZ68dRwSvHwbv7oIDFZaiZJB3bjOF0RRjRzQQE9MhE08GN
	ejRhZUkCXXo73GbnjAKZWYrQ7Qk/b6Z7WqUTbxJjBdDU4+MjWYWYvz/W+4+KP/6Zs35Fx
X-Gm-Gg: AYBFou16EvXJNczMHBVcfwdbVsvgMJAa5wMFGjGJWrZQra1yBeapWXXHCQFl6qAicq9
	8w/0MjKaMVV5eue8SkUrSP2spCxZ+iXC28zBLAsCR4kPOKFf+ArEWc7ZLX5Wf/Sv2ijXwGX7242
	ggrUwBgqb5Khu9/incQK7EVeV884NvowSZPj3twNvlzjSXaKBZehJSU6vdiCYNpvmMR0hoUilwc
	NyK8u979pM9SL4B0jf/3ZdyC29Vxezxpqh0q85ZUi+Sx3f3BQ2cTeyIOgXqd59h6kHtf18V3U8J
	/OjZZljueK/RhwWkT2WNLgSzWRNR/+cpd4BgZo7xg0GWiPwlacsE34jPFsKCfwWe2UN4PXUOoYp
	gchlWkOQhxngGi7eFiyFzsuqa1X5O7Y48IVdRkdZ+TFi+zuQ5IymzV7F+GoUIR80rL/2gh16IlK
	4+6R4=
X-Received: by 2002:a05:6a00:4f90:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8beb20cec9fmr9592570b3a.3.1794815300566;
        Sun, 15 Nov 2026 23:48:20 -0800 (PST)
X-Received: by 2002:a05:6a00:4f90:b0:886:3827:c4a2 with SMTP id d2e1a72fcca58-8beb20cec9fmr9592541b3a.3.1794815299983;
        Sun, 15 Nov 2026 23:48:19 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed243e643sm3450597b3a.42.2026.11.15.23.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:48:19 -0800 (PST)
Message-ID: <8abf16ac-7906-4ff6-ba4c-4e3f2c00b214@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 13:18:15 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] qcom-spmi-adc-tm5: lockdep reports invalid wait context in
 IRQ handler
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afab545 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j9aXnjOe7kIp99Lnl9cA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXzszbEowyTLPa
 gA8G3UU4RitzX5WrmiHSiELDpbC3rLYFV/1nWlo6eHLppYiI63khClYhRf/dHFUjIcqnzGjfuby
 HHOebRIQcs9hHTZzW6QibCa0rTQTUgs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX7PW8DWG/Ce1R
 QQWUbS/WadA0Qg/FMtEkdXrjWgzjJMqGHWreHOUDRt7n9iQE6hnvcZNT+uOPFfWwM6Qp+OqiXQp
 8W8T8VorblStEB/3Z2d30NyCbDJd0SLeDwhqOnWWsDMLy0Gf+IPmTmOA39TZ58oze9fjn1NLvpn
 m5f7hBLmCEW9LA8Qo+u8ZRq8mdXqtY/eLkZZjqsop9IJWjTx14Renlotdvh/lxgYZzuos3aXNpB
 7sTQf3wdzbrC3OkOwDZZ7Y42Y0hZ2Sh8kco+BJ+hiWLx8H5jDYXXK5o8z/+hmI5QKMTTHAscZ8o
 JlDRDEKRDpehQpCOCuxew8cxZvTfr6+ys6yszT4IY3CprVDfuosQdBSnEWVjUjhRngxYo8TjDb9
 gbljW5DFlSfktUX55hai6/5fLzEtLfnOe2K03xu+zFbXMr3h3s5fBfKk5hGGBr7tpRAAfc56f4j
 KfVVOJnmWFlXTLkXoZg==
X-Proofpoint-GUID: T_saevUx9Fshwqpmr8pJr3WR0UVLBcsh
X-Proofpoint-ORIG-GUID: T_saevUx9Fshwqpmr8pJr3WR0UVLBcsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

Hi Pankaj,

On 11/6/2026 11:37 AM, Pankaj Patil wrote:
> Hello,
> 
> I am seeing the following lockdep warning on Linux v7.4-rc1 when
> CONFIG_PROVE_LOCKING is enabled. I can reproduce it on a Qualcomm Glymur
> CRD and so far I have only observed from v7.4-rc1 and only when
> CONFIG_PROVE_LOCKING is enabled.
> 
> The warning is triggered from the Qualcomm SPMI ADC TM5 Gen3 interrupt
> path while adc5_gen3_read() performs a regmap read:
> 

I have pushed a fix for this lock warning here:
https://lore.kernel.org/all/20261113-adctm5_gen3_hardirq_removal-v2-1-a0c9c4800941@oss.qualcomm.com/.

The issue happens due to taking a spinlock in a regmap read during the
primary IRQ handler. The fix moves all the actions of the primary handler
into the threaded handler as having a separate primary hardirq handler
is not strictly necessary.

Thanks,
Jishnu

> swapper/0/0 is trying to lock:
> ffff000b67201018
> (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
> regmap_lock_spinlock+0x20/0x40
> other info that might help us debug this:
> context-{2:2}
> locks held by swapper/0/0: 0, last CPU#0
> stack backtrace:
> 
> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc1 #1 PREEMPT(full)
> 
> Call trace:
> check_wait_context.isra.0+0x2d8/0x380
> __lock_acquire+0x2ec/0x840
> lock_acquire.part.0+0xe0/0x250
> lock_acquire+0x8c/0x1e0
> _raw_spin_lock_irqsave+0x6c/0xd8
> regmap_lock_spinlock+0x20/0x40
> regmap_raw_read+0x88/0x328
> regmap_bulk_read+0x10c/0x340
> adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
> adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
> 
> There is also an ADC timeout around the same time:
> 
> qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000:
> Reading ADC channel pm8550_gpio_02 timed out
> 
> Kernel/platform details:
> 
> Kernel: 7.4.0-rc1 #1, PREEMPT(full), not tainted
> Platform: Qualcomm Glymur CRD
> Firmware: 6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 (04/10/2026)
> Config: CONFIG_PROVE_LOCKING=y
> 
> The full backtrace is:
> 
> [   12.924146] 7.4.0-rc1 #1 Not tainted
> [   12.927848] -----------------------------
> [   12.931982] swapper/0/0 is trying to lock:
> [   12.936217] ffff000b67201018
> (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
> regmap_lock_spinlock+0x20/0x40
> [   12.947855] other info that might help us debug this:
> [   12.953060] context-{2:2}
> [   12.955773] locks held by swapper/0/0: 0, last CPU#0
> [   12.960896] stack backtrace:
> [   12.963889] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
> 7.4.0-rc1 #1 PREEMPT(full)
> [   12.972208] Hardware name: Qualcomm CRD, BIOS
> 6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 04/10/2026
> [   12.981070] Call trace:
> [   12.983606] show_stack+0x20/0x38 (C)
> [   12.987398] dump_stack_lvl+0x7c/0xb0
> [   12.991180] dump_stack+0x18/0x24
> [   12.994610] check_wait_context.isra.0+0x2d8/0x380
> [   12.999552] __lock_acquire+0x2ec/0x840
> [   13.003514] lock_acquire.part.0+0xe0/0x250
> [   13.007837] lock_acquire+0x8c/0x1e0
> [   13.011530] _raw_spin_lock_irqsave+0x6c/0xd8
> [   13.013256] qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000: Reading
> ADC channel pm8550_gpio_02 timed out
> [   13.025949] regmap_lock_spinlock+0x20/0x40
> [   13.030264] regmap_raw_read+0x88/0x328
> [   13.034227] regmap_bulk_read+0x10c/0x340
> [   13.038368] adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
> [   13.044118] adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
> [   13.050313] __handle_irq_event_percpu+0xac/0x4c8
> [   13.055170] handle_irq_event+0x54/0x120
> [   13.059218] handle_edge_irq+0x104/0x1d0
> [   13.063272] handle_irq_desc+0x3c/0x68
> [   13.067152] generic_handle_irq+0x28/0x40
> [   13.071289] periph_interrupt+0xe8/0x1c0
> [   13.075353] pmic_arb_chained_irq+0x148/0x380
> [   13.079860] handle_irq_desc+0x3c/0x68
> [   13.083730] generic_handle_domain_irq+0x20/0x40
> [   13.088503] __gic_handle_irq.isra.0+0x58/0x108
> [   13.093179] gic_handle_irq+0x1c/0x40
> [   13.096976] call_on_irq_stack+0x30/0x48
> [   13.101024] do_interrupt_handler+0x88/0x98
> [   13.105342] el1_interrupt+0x3c/0x60
> [   13.109035] el1h_64_irq_handler+0x18/0x30
> [   13.113268] el1h_64_irq+0x78/0x80
> [   13.116791] cpuidle_enter_state+0x13c/0xa10 (P)
> [   13.121552] cpuidle_enter+0x40/0x60
> [   13.125251] cpuidle_idle_call+0x184/0x270
> [   13.129483] do_idle+0xac/0x150
> [   13.132729] cpu_startup_entry+0x40/0x58
> [   13.136786] rest_init+0x214/0x220
> [   13.140309] start_kernel+0x4c4/0x4d0
> [   13.144097] __primary_switched+0x88/0x98
> 
> Please let me know if additional logs, the kernel config, or testing of
> a proposed fix would be useful.
> 
> Thanks,
> Pankaj

