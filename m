Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D3C3AFD04
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279343; cv=none; b=KVSK0ZBExbT296sla/QFD3miMjuq1BPdpxsp2eyYnggnNmxk/UkE/snlnW+gkqNpRguXNb2r/BRrUffkYpftwiVq9wdVAhERG2MdbKTAFeMRP2ppkj0WUhmkwztEEuZoF2vqeqz3Ta2fI1v2YeNRbGHiKK2FRI4a2fByDceSBNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279343; c=relaxed/simple;
	bh=SR50l6vfw4QRs416ALVlOjgrIEeaalnThuxPXEY/1W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRw0aXapbZHwID3lMEgn9IHCU4Dsf7rS4JNm2HMsJQKX3Qm/iM/YqKG+b36JEdp3TLz2e4mOiXPVdPzvv84Pxv1aavEtcfsVIFL7XgCMAJsrgBdC65BkF/rqUNN/G8lj3knAdz3pIEzyereiXVpfZ4LDwBuGrNh6EGNc0DINsLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6e+X0do; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2yer1lt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6e+X0do";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2yer1lt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eDBW2834150
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CQoauwzkMGyF9WpxZI/9afok
	1rx7ghu7rviA237AL9Q=; b=X6e+X0do6J+VxdHoFc/REsGh+HIZbaYb2jJAw9QL
	S43rDz0q/0QJiuckGbbbtq6uoOt6I4G+5mnWEBxlYcSmAVnEYBl5DuRyz+grjq+x
	FsL8cFmX0xvGleBWxXE5RxBTQRW/85e2eCy0KEW/SgObBR3POGtVD0wJV8ubBJ3Q
	HcyidC0qSuAnCqTesPc2PO7iOywrMYKVoA0Jt/5FMuX56QmA2J+8QduESq48unJ4
	4NrT0tj0ltyfdDKI18+DtqyPb//qAL7faNlTrtfBudnoNyApQxMPUgnXgnHGc/0Q
	/yrdw7AedaKwS+KbGngu5iQfzB8hyawrSsCaxwcyQAbkhQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dnckv74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:35:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d49d8dee1so662271eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791279340; x=1791884140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQoauwzkMGyF9WpxZI/9afok1rx7ghu7rviA237AL9Q=;
        b=T2yer1ltCSfNKCNbTf2RXQOmIvkVWrmgK1bsRp0F+DzYeAZMJaupijmFFtiP0Dy76l
         JXMG3gjx2/8ifcN101HRP6sLYasFMrFyqZAQ2kXGdqGMkn4GvK4Q9YlBXaRAjkZY2j8W
         Rwo+zOP6go3eBxc1bvzh8jWVD2At9p1zAGv7M+Uz6C4BEgMDErvAHpHdEaiPe6WEabOV
         9ezZxtrI5qqXHmqELZOAlIG0nRSQ0UdUAPJFVBiYzWF/ukuwjA0vpAlOFrbFJPQwo27B
         fsY0wdBi2PaLNz8z7EQNiZXkqd7AK5LrIq32t4KtNV9U8WqQN9xxj5n7FxS+QDVPLFDd
         JL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279340; x=1791884140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQoauwzkMGyF9WpxZI/9afok1rx7ghu7rviA237AL9Q=;
        b=z1YKjN2tlQ3VtZP7d/cXJHM2ae2yID166orzkFSX+IccSmxOmzILI7az4oLPeGz07o
         h0g/EYsY+d/T2ig9Gc4NpnlBf/N8Jvk2u26D3ONAdlaiLIFfgHZlrAF/gP9Sxz+A2EJZ
         zb4Y8dlgjiJ/7aMP6FYfHp17JBt1xTNBnKndWfzXrGDP6VJYxTowCEv6XsOwIUG9dOf9
         dsfkgY5T0h++FcUdzQNV31h/OFlQ33J4JQQ8k9GhuHVRaciEmt3uPq1wdZTfFxRRevHr
         Oqwnvhyc6mj+8P5ZHIznd+K9c8YGs7xSY6LgrbRYqt1DHbXndtaRqfMBW2P0yLRhooyw
         s4Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxhv725J9Bf2EjviqzIB+FiIGK/2alXSSeM/2TNCgoutXgEMjCHHhJ4Ft8w/kXy8ApoeeQ8UP0vnfE//vFJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJoo/8JLfUZOPDVCKmvy7o4QBDFbYH7HjE9gX8ujoFJEyQzDRDu
	mY6KVchPMBwslijuMTcYoAgxhix8NLUS9nAc5pBGwc05tmly8nCT/aXSxwG3I8BpFj/icuCaU7Q
	Yrt9Fvru7xhRJzXHoSr9YILRp8XefWhI9FmjRjszgXEiGoq+monhibjxxOG3aoj2IzY0r
X-Gm-Gg: AYBFou0lDOFipfCUNlTOPzQIQmJincpcOLpstKuaiVzWhUyi/yEAnMIXo670mwuzwzb
	nyGdQs7ID0qqgzgRZ3uGY6k3S7DFeTawpJaio7iOtwVQHGy9d5W44M7g7KEq3wvYUGE+yvJDOm0
	KLtpJYKI379zYelEBL1xw1tFYeAP81AzpQmw3smd+AkKV1AptBs+VMXI4I2J3dgFjot7jJcCigW
	Qw7LuNH+LZVuX/tjHU84L34YrYsMKjC3yHel8Md0sV8B8x6QO8JaasZmVRZdjTneWx3fZ1Nm/TZ
	6B7HRJc+/JgWY4rDRPWLiYvwU4NwsmGdp0F3voL7k+swEPjzaMIa2nXNftmVmBzWD05Aq+pfWJ1
	4cd9hoHi6cD0PGRDlrPBa0EFqmx4=
X-Received: by 2002:a05:693c:8207:b0:328:3cce:4b3b with SMTP id 5a478bee46e88-3514dcbf19cmr1052623eec.4.1791279340340;
        Tue, 06 Oct 2026 02:35:40 -0700 (PDT)
X-Received: by 2002:a05:693c:8207:b0:328:3cce:4b3b with SMTP id 5a478bee46e88-3514dcbf19cmr1052578eec.4.1791279339612;
        Tue, 06 Oct 2026 02:35:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b0fdc4sm6903108eec.25.2026.10.06.02.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:35:39 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:05:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mailbox: qcom-ipcc: Remove redundant
 mbox_controller_unregister() on probe failure
Message-ID: <20261006093533.vbaihilgcbxonefv@hu-mojha-hyd.qualcomm.com>
References: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
 <20261006-b4-mbox_double_unregister_fix-v1-1-9011ca208d36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v1-1-9011ca208d36@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOCBTYWx0ZWRfXymE/REs3/Jqe
 GD+1si9YpQ3cFIN0hdDl08UGVCJGf6t0GcV0NB6HCg/N7LLwj8qKOi/TPwMVfzdQ53gbQq34PvX
 OC3dW4LkUtgymZPd5jYltKbPNmIIQzk=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac4c0ed cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xVKd0v4-oltqwKU808gA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: X5x1XEdWLfnawXQFWKgB84IG_dIlQhe4
X-Proofpoint-ORIG-GUID: X5x1XEdWLfnawXQFWKgB84IG_dIlQhe4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOCBTYWx0ZWRfX1X023CJeE5cZ
 VmWwhIMSqQHyzx6dNMy3cMM2va0TkmFJi3ksO0ECw25cS0UdJ3XRbVk7uGuikRntFVpKrOZja9+
 oKWmBcQQYEUkE1p64GzacgpnnIj2dwQ8H7R9BYvsvypOavFw2YIRcWMSvTwY8l2XzgLXBbkn1WE
 Dmhs+SpnASo3kk2kmRw2IjdgqaAwUxREvKzPKSjK2P9V1BOygxU0r7MGPTXJicXb0fW1c7Cf6wZ
 rssbzxWEuehLUnCE7fboa1/ORkpgoO9tBwJBce7+lb/yRdexKptfgbM5Y0hWm0KQh1TAp0mx9Sf
 TbaqbKtC2JTuLLTamsm+brZAOBWMH1IdKWlpTbepnTrH4EM+NG8hGX1ZiUBS2RGx6ZrvGpGXVpl
 uhkp02KhrparmRSYkmf5Ot0VglnXQQ0WaIrEiDJ9irtABEzasbiYpgy+6BVbhpcrjBvaq6Wh5UR
 DObrfN/guSFUlgWz+2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060038

On Tue, Oct 06, 2026 at 02:44:14PM +0530, Anup Vishwakarma wrote:
> qcom_ipcc_probe() registers the mailbox controller via
> devm_mbox_controller_register(), which automatically calls
> mbox_controller_unregister() through devres when the device is removed
> or probe fails. If devm_request_irq() subsequently fails, the
> err_req_irq: label also manually calls mbox_controller_unregister(),
> resulting in a double call that corrupts the global mailbox controller
> list and causes a kernel panic.
> 
> Remove the redundant manual call and rely on devres for cleanup.
> 
> Fixes: e9d50e4b4d04 ("mailbox: qcom-ipcc: Dynamic alloc for channel arrangement")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-ipcc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index 185b63f724d4..206ad4884987 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -336,8 +336,6 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_req_irq:

Get rid of label as well..

> -	if (ipcc->num_chans)
> -		mbox_controller_unregister(&ipcc->mbox);
>  err_mbox:
>  	irq_domain_remove(ipcc->irq_domain);
>  
> 

with the above fix..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
