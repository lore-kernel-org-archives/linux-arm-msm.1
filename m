Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ECA35AC14
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478635; cv=none; b=glNwk1sB0OqxGsG65Fv/fVk5Fbiomij+A5y+TBlS6zbsD/57e9ZV+sqTFXBKzvLBc7yNLWA1jmzIou6Z5KDw3Do2lwhz3RsRFmUaPric0LqfnHRjFxPtuGu2dRgPYnPtOksxcG5J+3ocecu9U3FhgsJQSN/b/rXHzib25mrKnl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478635; c=relaxed/simple;
	bh=sLX0RwHjJSbk4GOCKbJnG6p++VAp2P5gi8L06ecaSrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNotgOcNs1nfTNLoKeXN4H7CgQZoDKpsDouXbC+S7h2QachBcTybFdNMKowp/7caNVb9j/DmoEmGpzjnGC8B7Yx+sY4gWnsTGQLACSY05SyrDtoIbkFcARYF/5B4yZmqVWXzk2hvIcOd2nvi5iedLvFnrl3o2FZ2uZ+G8i4iNKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fN8+Ynir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVtY1Fws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fN8+Ynir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVtY1Fws"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67hmX3011196
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4l7IylTrV7+WbYAv8Zw4WOy+wYaL2MEqhPzc8HHXHYo=; b=fN8+YnirddVyk8ia
	LNPVlcHbu0O+QKDLTJfH27a02oyP3nNCB93T78kdkWmTTY7C2Pbz5T7rcUPRz0NV
	gewceT3tsodaGxuWCbnzd1eBUZi718ip9jFPDt/ObNTRZHW2qbylN0IUl9BX89ZL
	J3X4+wMvH8a9ozFAGVbfl/H4JuogdzT02IaFOr6JJa2YpgKWO6eamHTdDmH/Synx
	GYVj7lvyMJWkToW3wtvvos92Vg6NZQN3zG8z+cVANAUsmhW4xznMJRpDYv3kVkEK
	gDlzApDxnaUuBviq6Gu0YqsB64bveF0iIBs8ziplS83LNcGWpb5cadiIOV8Rkc9a
	SAE72Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5n811f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:17:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so12901185ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478631; x=1786083431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4l7IylTrV7+WbYAv8Zw4WOy+wYaL2MEqhPzc8HHXHYo=;
        b=EVtY1FwsudmlleI8bacJGDnOd87VykF9sp4glO9i5x7z9068ND2n0Cq/UdFzfeXWvB
         atMtKpNE+qxtyXV6Zlg6nuV8R57nwT5RSnEX18BFHLNT9wsPm7H+XSgY+pANSKKn4Awn
         ut8PNLBd/VBvwUxlt/8Dk/JcBSgkTAYuw2LvvsWgbj8FWHqx3uQ3RllNWcbH+SvXLZMK
         FNQNq9wqQiSfWXyJDv01KdY5T5RhfgJWiCWwT8nE3UwdUtFegAAxh8DShNGZbnFsIDYq
         acFP0F3w/RpS5orXfXHu73yv6Lvo5G5oThfO08k7HOcxSfZzO8s4Yu7uDgGIIUHJyepQ
         07jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478631; x=1786083431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4l7IylTrV7+WbYAv8Zw4WOy+wYaL2MEqhPzc8HHXHYo=;
        b=JvBibMLwDnQZ3A4i+zsuAaoIWW8/TZchyrRQeLDTPQ5NTBq2M3dy4MUiPv8RWrAJar
         eKmkweEbSqqzMX0Du01FbHlFFpWf8pWJM0bgG50xtQw/vGU1D8uqqbceIbfg1oQVpa/l
         DPumC/YGfkzbBkLZbcPSbPnaLgGPo11dZk/L7C9TPLW45VHyMZRhLq7Jkr24BO5OxCx+
         zWpLzGnxdfj8AjKRCxN1/hzDP77W2CYR0es11tWcGdUvKJkYv7OVxKju1N7tbQd+XAoa
         uc8efgZI7wv+1zucfhnlLRQAvvPIR88tyDVB9wGGDjT9e8LZfy5jODxxgn1K3E0Yg48t
         bJLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDq1hyO5O2TKOqrv5cfYDjtCABhDj5Uf5xOTj0B3v0y5b94anY6jQRitcbBKlYeSFqlXYAHe7ujfGHwWG3@vger.kernel.org
X-Gm-Message-State: AOJu0YySkoZE2NpnoUNU7kmg0R6GsI0UdIgLeo+HxR3YY/c5l3Jimx1j
	/7XNmz9AbJjxs1qK7Ap/OJIR0vL2FPDzjisVuDh+gOkLzDYaYSgcAIyL/8Qb/CruY0W27b4afUF
	iML4usGkrO2Fj+kBRz5MQ+0mpf1sKA7Ds97dhvHM2G+YpBJBieCiTBSAli8msjgVfF/pu
X-Gm-Gg: AR+sD10F2l5MrdYoxLKvWggof5KWbPpfUA5dzsKvwjgCUOdeY4WMmfreW17UVh6wHQK
	0OAQ4x/lQVo/oKx2qg0qIDRX0lZ8t5SIRX4AGgobOUt1q3HGyl68b9XVX8VqVmh6XPMNfu+HJ8y
	xVFTJmEm62fd5vqrPuW/7zBzzMIOTaNONCynvGPKO/Cl2Sbc1MlYIownop3ldAa+gb/Ck7vzsbF
	uIA1/WauCDcLeGZ/eRzcwPzurnbHudz/Wpv+qYoGQLdoyqm/auAVavVhMp8bBg4D6hmabuoeB7H
	bTPplIjDU8+g1OEDDAfY/2kjecAFWLSDzgd5eBGmdZZ8HqVe171PZ5vn4yQ6UF3/TwNk8zSUj2w
	7VDhow5eyeDDXHQRiAcQ48YqpMHYMFg==
X-Received: by 2002:a17:903:4b50:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2d046e7c719mr8401435ad.24.1785478631581;
        Thu, 30 Jul 2026 23:17:11 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2d046e7c719mr8401225ad.24.1785478631128;
        Thu, 30 Jul 2026 23:17:11 -0700 (PDT)
Received: from [10.204.78.242] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb486sm799165ad.53.2026.07.30.23.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:17:10 -0700 (PDT)
Message-ID: <d6bce7e5-5077-40a2-89fa-d1add3144d84@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:47:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: remove mmap entry before remote unmap
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260624174652.6792-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260624174652.6792-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mvBbp74u7Xd47UwWpTWIC2mCGExybTQ-
X-Proofpoint-ORIG-GUID: mvBbp74u7Xd47UwWpTWIC2mCGExybTQ-
X-Authority-Analysis: v=2.4 cv=bKwm5v+Z c=1 sm=1 tr=0 ts=6a6c3de8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=kqHp1m7fC-4U1ryjZVsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MiBTYWx0ZWRfXwXVOyjjrg0zM
 xXLEVs+otzXE7lf7QcFdUqlV2RE6LJgP3MXIVWSI2JBijwVfWPXzWr2qz8K+kJ2iVwiOc8V+x1l
 pVhMIloZ1imrOGBoTjPWCgjZSkAkYUx/ywdwlMfz/OSC/QcxLmqbH89D10LezkKgfrk2doA24PH
 p1hd6I11E0T276zCQ0I9TuFByfH6PySChqLlOrNoyCR/JnVyg41dJWDV3lXaVY/im93F+4XFQLD
 QMh90FChYrk97iucWVZa2V8GrRyMmcv0UZbCPt2Uph6OMlRkTL7rKkXCCPCg6xsXcsdWoN/Ezdr
 3v9HHi1Vp/ZBgmJ+z2bB+APRevixETBYRy0BY6TckXz7yebmw3V2DTFtsC9IQg5hwAqmNuknHQO
 08sl3j61SNpcxgBvUE5206iDsQm1275KtUspOZgwwc7YdESEmpQpQpLUxNSLZdSfrtJabtDdCYH
 oKgwUS2peMloRFaBzqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MiBTYWx0ZWRfX2pMT73l62bH9
 mHqtR19UyWdn75Pu6TAJ6QYjNqknYQOmtyAR5kIemoSQA8RDHaJNPkGA3Bcki5KddUrJFDVGMEB
 pNmgptUGj1Wb6o9O/G9FKSaRZEhJchE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310042

On 24-06-2026 23:16, Yousef Alhouseen wrote:
> FASTRPC_IOCTL_MUNMAP looked up a buffer and dropped fl->lock.
> 
> It only deleted the list entry after the remote unmap succeeded.
> 
> Two threads can therefore find the same entry and unmap it twice.
> 
> That can lead to a double list deletion and double free.
> 
> Detach the entry before invoking the DSP.
> 
> Put it back if the remote unmap fails.
> 
There was a fix that got recently merged to fix the same problem[1].

Please check it and let me know if your change still holds.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=902b8ec9dd1098cc133cffa8be0b6378544f27ba

//ekansh> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/misc/fastrpc.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ba4ade874..6a5239b1c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1902,7 +1902,8 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>  		spin_lock(&fl->lock);
> -		list_del(&buf->node);
> +		if (!list_empty(&buf->node))
> +			list_del_init(&buf->node);
>  		spin_unlock(&fl->lock);
>  		fastrpc_buf_free(buf);
>  	} else {
> @@ -1917,6 +1918,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> @@ -1925,6 +1927,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>  		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
>  			buf = iter;
> +			list_del_init(&buf->node);
>  			break;
>  		}
>  	}
> @@ -1936,7 +1939,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  		return -EINVAL;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	err = fastrpc_req_munmap_impl(fl, buf);
> +	if (err) {
> +		spin_lock(&fl->lock);
> +		list_add_tail(&buf->node, &fl->mmaps);
> +		spin_unlock(&fl->lock);
> +	}
> +
> +	return err;
>  }
>  
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)

