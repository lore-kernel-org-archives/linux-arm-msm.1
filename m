Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B35432BDD
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559243; cv=none; b=ITzW2wbvm5MBYV3udMrUoVsEiwgm+q6OnqfTcBwEQrx69+dJrmb5zmzsnRs2Ptsh/LTbgvpqSQXb332OrYp1R5FV6i5o+MFf214FNOQ5MyfNmMxk3eEKY3Np3oS/zgkpOPfZMum2xoUR/760+loP3UGRHyk4atS61qy95OrMuGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559243; c=relaxed/simple;
	bh=sM9YmNWfMmoiocBXULNeg6cU0ZlvNNgvQsC2ez3yeJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsVFDVVuIOLdUpUHhkGYVb+45lqYujnQnFCjYjEd7udJ3/N6yPHP0x7vx4d9xaKScK3/o381t0mPnocSqbZERJYVugTKvCSI9xOJHk4qU/7L4ialV5+xlB3YrndlcZjtFLI2Twp4cV/SycWmkHDZvJtnbQ4wjUUMTELFZKTakJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtR3daYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDbhUQuj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtR3daYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDbhUQuj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqMjN2745293
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fs1mfw6KDw63FRbepMb9j5Ov
	/nDWq0OUVq/0/mks0ig=; b=TtR3daYd79B6l7VKXuUF2O5lN8dSLjjKp7fFMXu9
	85HkbPvj6y+NIN9G1StixzyzPCJbFJlcV0DCU1Mn6YzYtl1COSDLIWP55A+raK3I
	Nd1Y3gGHI2HnuaYKXHUEmgdXIoUvJwbtuAgkobNmvj7XLSg9x09QbNFl4DCxzNki
	fQWz7zl7NcOJZMGTatdIMvgoGHrC519jRUbHij8yTt8yPtMxLamxLVHPhJbWt2+1
	+ailGv+MUj7dSMiwMcVeUqn3xgbGdcQ7K/0+IjrIMZoYMknCVPkgEKm+IUs860ED
	CjMtyl8kjGDs+I4Zvve4se6DzUvlWjPqC7VEXDbPVxbDPw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2f8t9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:54:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9772e18c186so544559241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559240; x=1785164040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fs1mfw6KDw63FRbepMb9j5Ov/nDWq0OUVq/0/mks0ig=;
        b=XDbhUQujh6W7l3JUJZagAIOXmq58/cvvMPH+I5aChJSInSqWb2RA9AJW3DgV/njPX1
         r+d6CqNJHlgp9X8urLEipM5WyKFW3P2Vl0p3ZsYWydVZT7hctZbzeFFZaA3BuDBx9u6s
         hvDjpdTOAdyFuHMN5xdRp0migaKyX3cDJ7z6vnv7gTTpw7tXS6yoDCyI4BQJQnGzh+In
         xkJprMAL1bI8dGCMBIPPNblB4F47AGG3oaLSLdsnJZ+SFeDh/YALw7W6U8rqN4l2o3wE
         86udQESaCAbtTJ7OeJrTPf6wOCGN3cVYKbdJ47IlLT2+3rUTQjNeRlDlNB8teTiakP5q
         Y1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559240; x=1785164040;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fs1mfw6KDw63FRbepMb9j5Ov/nDWq0OUVq/0/mks0ig=;
        b=cNVhzgxgHbeUAl7j5hOo+L67w2UBS9iSChyIBlHI9QT6br9uWLrDVOoeOiWl+nns/l
         kU58Hjkpa56/G3aWCkDBtF/QruD3mIMHXjRYQn+ht7Vis+LDTUeCR0UMVE1/U3owNOa0
         VImAVJ2dU+zfRALDZJHcgbk9A25gn2vW3m0dkJkrEfBg54R7gjezGl+hgqSwPQUXShet
         mL6GjAOf5L87d1L0VTT0M9lfbSnG0FIROuzlFxvm05PGsq2fyDNblGXNnFvnEAU9ypdG
         i2i7CaueCMub3+vtlsCmE0titqhjX4a4MIwfjOuRnqutUsrCmiglwsgcp5cGxl8Tk1r6
         dknQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCrI2JjMwD0Q6xO1J2w5aT0cSS6Ta1sX+gZZzNDdsWWXDuDZYS5zCAYVAW7JExtrxsLQMM+rdTqB1JhB4S@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4EQ0IiMqPTHkz1lzle6SIm51vek7iByAoTLSWikG/s9mpDDg
	T992+vymY9mBW60oxX/EOY75BBlje4zmRxYS/Bco9KWxPUs1kXZujj0S8TZ8NkH60/n86VUCgIc
	HRR0aS140ZZ1rQVhWwO35UAZrwDjLEaMgz6+gQywbvLlKh07J+gAN6OFSyon/L5UuAhak
X-Gm-Gg: AfdE7cmE2WBg407xZeztKz1qkv+I+GDPmDcTUb1ICF2Xwwk8On++Qcm7N5VHmWpynZT
	wOeEc0ArcjlviGGsqHk/Y9rfHyLEHtJEb5ENMYkX36MdEA1DTR/Tcwks9j2jtIG3dwhmprYt+iH
	gtRKO4Hh2Z6STvIYbBTTIqtGjYRlaAQJiologOc24vT7pNv80XlCbvLxNI0EfB71dheLCLtOSOb
	ojzGZhOapSET/cSRW8KD7rNKQr5aH4DyzcOvQYO4AhHZhel8Ff6e90F6piNPrYAJmcv+c2k7Csc
	MGxelA/pgWlI9Wi2XtafOgCXVnJ6l/IWgL68Dy7T0i0IyRIHZwrgBqtMHYXkAqVXRL2s+rJNj+R
	sYdOgAeCqFoyTJ41w2p/8x0vSy8sR4QMViskHEgT9e7wTJv/8FWw3QDi337ofgT6R4fi/Z2e5oZ
	XWiV6OVeuTYHO9KA==
X-Received: by 2002:a05:6102:3f06:b0:650:9174:32b with SMTP id ada2fe7eead31-74753439e95mr4713792137.1.1784559239612;
        Mon, 20 Jul 2026 07:53:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3f06:b0:650:9174:32b with SMTP id ada2fe7eead31-74753439e95mr4713766137.1.1784559238985;
        Mon, 20 Jul 2026 07:53:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb4fd4ca5sm15126371fa.23.2026.07.20.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:53:56 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:53:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: raoxu <raoxu@uniontech.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: btqcomsmd: destroy RPMsg endpoints before
 freeing hci_dev
Message-ID: <5be7vkmpzmizgmvqxyefubgi3epnlo2uf7mabcgsapvia4ckpm@ixwfppk5z5e5>
References: <0CB2D8D715AB9933+20260713072543.3348755-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0CB2D8D715AB9933+20260713072543.3348755-1-raoxu@uniontech.com>
X-Proofpoint-ORIG-GUID: 3KaahfzxZImCYGww1lKmJ4Pr0HxkTPw5
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5e3688 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=iHwBjlyiAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dfUa8Pt-6JdyB6YyXQgA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfX0mPr9c/XxE7F
 vS2kLmU2Ui0vDzvuDnxC4BRjHg5CfIf2Bw7Py9GV3Ivtv6RhEoehcBuvWaXUWbQJM1G9NCfTtCx
 4dBAMrz1Hb2U86sJsp6QEMg30h6YijU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfX2U3EylCRw1VQ
 /DWmjGwEb8cKccx3eb2+rwyU3C+GRUBWKbwi3z5QW7ppG9LE9TAtB012mf7xaf7xX3AaJ1prCuK
 AEgQbFUzt6hrq2j1euq3yefyDfSjy3beFYGe0+JU33xz4K178AMCNw+pxNqR6jl9BsseX/PSi5T
 6QM2vzgSDnf3ln1gTnbI1ESMYNkz2bkHCQds9xzH8VK0Z45VUWP4aAEmm3MjZU7cF6fMVrQtHo/
 f/etD7C5d5dmNyEmWj+9T633xUdMkiPnekQOhD3S2SDW3igXqcc1jf/LWg86PPvz+Y0LiwQaiI/
 83gCQPL853WMvGsYLAaAx4ScMh07jOoSdDxci383m31Oy2r316b6xEjZkfcoWiOSrLv4oi0rhnh
 JvzISViQK1o369kmallr+znLUNIo2QWEcrXWwvyZ+CUOlr683CM97qRYRz7yOanDsNGyd0IP4Um
 z0WVdunvXGX2Q/d1lwA==
X-Proofpoint-GUID: 3KaahfzxZImCYGww1lKmJ4Pr0HxkTPw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200165

On Mon, Jul 13, 2026 at 03:25:43PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> The command and ACL RPMsg endpoints store struct btqcomsmd as their
> callback private data.  The receive callbacks dereference btq->hdev
> without taking an hci_dev reference.
> 
> The current teardown order frees the hci_dev before destroying the RPMsg
> endpoints in both the hci_register_dev() error path and the driver remove
> path.  If WCNSS delivers data in that window, the endpoint callback can
> run with an already freed hci_dev and pass it to the Bluetooth core.
> 
> For qcom_smd endpoints, rpmsg_destroy_ept() closes the channel and clears
> the callback under the channel recv_lock.  The receive path holds the same
> lock while invoking the callback, so destroying the endpoints first both
> prevents new callbacks and serializes with any callback already running.
> 
> Destroy the command and ACL endpoints before hci_free_dev().  Keep
> hci_unregister_dev() first during remove so the HCI core stops issuing
> operations before the transport endpoints are shut down.  In the full
> registration-error cleanup path, return directly after freeing the hci_dev
> to avoid falling through to the partial-construction labels and destroying
> the endpoints twice.
> 
> Fixes: 5052de8deff5 ("soc: qcom: smd: Transition client drivers from smd to rpmsg")
> Fixes: 9a39a927be01 ("Bluetooth: btqcomsmd: Fix a resource leak in error handling paths in the probe function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/bluetooth/btqcomsmd.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
