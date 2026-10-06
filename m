Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C39E3B992C
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279036; cv=none; b=kiHTqmFRfFqSfLK4WOdpkbjtQxi2ECqxqqgOJBhr2VllJhs5dANsoasmr2ygCJYaIxvqZRi/6AtSl36PmGzdWtrYjDdzXY9py4R0sN1trNrJV1huFGg5YBghkD6/MzxrS1DgwEmcMiamB7cI1BCl00cUpU+F/L6fOfa3RlAI2vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279036; c=relaxed/simple;
	bh=GCH8P+TxCuUgHhKgsDlPxLl428dLPV23SwmTsIentkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUI+Ma0erVmblPcUZHsz5gQjqdiSXBKKF0l38g+5IZDYegOl0cNLXPa9wcvKcyiCEsxVmdWOMtbAM5rd1+QkBH35NhRHa4mpgyBFiinCof8xN+pIwJ/VlvosPegJI9PzYcARH41eIMEOjUBGvULRTKeIi09QACWjzx2N8hpuEWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JK0Tj/7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eg5tA2K7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JK0Tj/7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eg5tA2K7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e8Vc4103501
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Js0Grhrbk+nnHCiSbpn04PWE
	2JsvC97671SKeU4gMJQ=; b=JK0Tj/7phfNX0KLhZgTNSKYUWatJB8Ep607jl+if
	Bo7aaWlPWz1QFPCyzktvMc4qLKODrE6Gd6ay4lBEwZi6NPhhKDC9raErv05JjiDf
	7JgbbX+D2a1CswrvAtrityY+1pwfzTpz7DRfgdh4K4LpaME+OzWA8bEicY+Gzlwd
	w/RWhfuFEHbcckAZz7NxXVLCR8092Umcjba0jQwqUe3dk0IeYHqEL/2h1GlKHYiV
	cm5SeRKs1hMHyz/YhAeUZNX6CQeXhfb5+xhAcnJGA5IzJCyrV7nHVIn6MO74qaKz
	0gnRgYR8K0D3jtnBi2BjZHXt2Kwg37NxRfgaeo2qUhq4Xg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0axj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:30:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438719cc1eso3645766c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791279033; x=1791883833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Js0Grhrbk+nnHCiSbpn04PWE2JsvC97671SKeU4gMJQ=;
        b=Eg5tA2K79hQRSyNbrquenQ+4LvCDaQp5lgp+xwz32BuEYXQEtt6e/GpL2jLquUZsPv
         0wK8ybbat5Bvt4Bug9X7p4i+g+gXHBF1Is7Tyvazm3DYnBWAoPt2LKk4iUtzxcw3JLfU
         CzhV7iv8eC16z4pHAs/Z48mANAVZ036fS7zqHJrZ3yDTXfw2F1M3pNNVDL7N9o6TYVtX
         QQSEpASK6XH5FqNOYIDQzG/RP1Q953OYGsPoabe3ETdtvht4t9oZLnQS4zNMCtCSxE4A
         ZsqBn9jGOQDlll2K1yn6iBB5FaJ8oKqODd5yrvTRpl6w7ci+42znYt/3KdokDJs9msPK
         I93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279033; x=1791883833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Js0Grhrbk+nnHCiSbpn04PWE2JsvC97671SKeU4gMJQ=;
        b=1dWjHjq22OxoKLV2mOcXuteq6wEe9qIM78PjnEVwYRaIJC5gAEle+Lnp4dgXPSwTrE
         z7FFZtCao7fFVxf4T4vsQ06nHbizKreEYypcERXTupIrndljQ77n6SggisZcFnUCysIs
         +6VNnkVfBu84MgD63QU+/W769XTokgqeFz2+IMbIx+m8oHQwJVsq/0q/Lu80FrPZ/K9y
         Y9oW8d66SNdO8EEVbX7wO94QOGEzPQ21Z+AJYHPaDB7eWoXuwOhW/7jmjZnDJuxxM5Bn
         jCDaX+QTGmlfFgDgnuPPyUmXY82YDTQtfw22caCJKHVBSnmSPZeUGcJg80KGAa1SYupF
         slPA==
X-Forwarded-Encrypted: i=1; AKwUvByYU6XnlBXeS3ljcQhldG2p4f0n3lWmZYRwA9vcdB3sBTwe0nb9BrbIzZQCcIgKo2HdQ+e4Aieq84nzvI86@vger.kernel.org
X-Gm-Message-State: AFuF++lF7H9hKwbXW34mPyT3yO0pLeCDyHRsrxDBRoxEYy3OLPzDQhbD
	m+Ss5qTlga9VNNNAlMOyeAtz5qi9jcK4msX/K+mdlCF4Sz+gFOX9ldoAPrVr5tRV8zZLnCrOrhA
	SUK9CJa3lDE8e96iUfSz1NgTZy9Fmmv4FFqoWcmiAXvvx1iFufI8hxyU9QoZAr1FR6U9rTZ9O9k
	R7
X-Gm-Gg: AYBFou11YVDjWB8T3etUQgm85K7CwVNgUe+8cEM5Z6BoDualoklLNkrvb9nIb2bH4A9
	5EakRRRRHHYXPjoio7PDQ8D/nzZkRJMIZRlFWZ5tlvpPO6cEzlEbAa/Y8u7D58YvXMmWKTaFZsV
	sNuFvC6b5NXOC/xraMsl4l+3iWyrApr0I0Q/ILtXS3ZnHmOqQjFkQ1GLaZmkcKQjFHWXklka5JM
	RpA2JGoBtSAMVIBU28EzoQBu7Y4fOENxyPlJTKNg49eLJn7L5Mi1SH7ds4MPp/PGfVc95iBh6iF
	KTczwd4KUHAlm/XtmqyptZTNxCTCRb5T2J+XcwoUG/gUpQGNCv4/gsOBk6D1tD1oz0gq1cNC7YJ
	wcSO9+ro3nxu+RLI+ljhAPtHA3GQ9JGVM
X-Received: by 2002:a05:701b:2404:b0:141:5281:8a41 with SMTP id a92af1059eb24-15ec9119a29mr1074082c88.9.1791279033097;
        Tue, 06 Oct 2026 02:30:33 -0700 (PDT)
X-Received: by 2002:a05:701b:2404:b0:141:5281:8a41 with SMTP id a92af1059eb24-15ec9119a29mr1074067c88.9.1791279032543;
        Tue, 06 Oct 2026 02:30:32 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84ec510dsm8009395c88.13.2026.10.06.02.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:30:32 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:00:26 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
Subject: Re: [PATCH v3 2/2] firmware: qcom: scm: Allow the SMC request to
 freeze
Message-ID: <687efc4e-e19d-4cea-9d2d-45de1ea2cedc@quicinc.com>
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-2-17520fa3c541@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-port-scm-patches-v3-2-17520fa3c541@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX4ewoacnNhhfY
 DxcC0lYlds7uXcCTbCjb8q3pEGiX6x0Gv7Ti2mb1JiKJaLydI9AdBP2+AD5g8nWFwUU+a/vWBxo
 3llqm7ev+qWiOJnQaSmanDl9ZyUYnYTUTyweru4Y0Yh9pESWCrXJphlHeI3rkTNKPAHRSlDbsNg
 KWdVCn5zbvjDei+6BGMmXRX+OEhioR0WUgcfbcoUrzXoL6i/O75qUNqg+Mt2308aYf93E/aAqEV
 tZWFm20EcwDYmJZajkLbmElg8/nbcqa9ZX492Mkr6PtR28BVz4BK8zcHPs7F+sl0dYYMskk6Sr5
 zUY2l1peARxW/9qeb8y4i8SirH8csNfMjrrP91j70vxXJRMi3nhsOyx4BzMI1NI0N8RP470Awkr
 kMt+2fPLw+XMdbX+vrco5NtdwKUkxlrTZX2nJiOCCpwuXXrKJYBScuEQuH0jGT7OwmDtfW8nhG0
 3ZXY58h31SxnU9Iyxlg==
X-Proofpoint-GUID: zB1oGHmHI2ElyIGzEOchlT3FlE1P5HlZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX6iMmlErHK9iH
 gnGK8YFcyG680H+0jZiEZwE58vfXlj9+kFjNB0irqbofl3+fIgEyxnSnnw79/nKuyyns/dBcP0Z
 GFhitKh9Qftf61uLWZNekn+9rgVIxOg=
X-Proofpoint-ORIG-GUID: zB1oGHmHI2ElyIGzEOchlT3FlE1P5HlZ
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4bfba cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=Zou3vVtG3ksA4Fj0efAA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037

On Thu, Oct 01, 2026 at 06:16:49PM +0200, Albert Esteve wrote:
> From: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
> 
> qcom_scm_wait_for_wq_completion() waits in TASK_IDLE. That is
> uninterruptible, so a thread parked on a firmware waitq cannot be
> frozen or killed. A long wait then blocks suspend, and shutdown
> cannot tear the task down.
> 
> Wait with TASK_IDLE | TASK_FREEZABLE so the freezer can freeze the
> waiter during suspend; after resume it is still waiting
> for the same waitq completion.
> 
> TASK_KILLABLE is not added. If a fatal signal aborts the wait, the
> driver returns early without issuing QCOM_SCM_WAITQ_RESUME, leaking
> the TrustZone execution context.
> 
> Fixes: 366f05e348b2 ("firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()")
> Signed-off-by: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index ea4481385412..92cee2263ed4 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2664,9 +2664,7 @@ int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)
>  	if (IS_ERR(wq))
>  		return PTR_ERR(wq);
>  
> -	wait_for_completion_state(wq, TASK_IDLE);
> -
> -	return 0;
> +	return wait_for_completion_state(wq, TASK_IDLE | TASK_FREEZABLE);
>  }
>  
If the wakeup happens while the task is frozen, the task will come out
of completion only when the task is thawed. I don't know if there are
any cases where that is not acceptable now that we are making all
non-atomic calls to enter w/o mutex.

Thanks,
Pavan
