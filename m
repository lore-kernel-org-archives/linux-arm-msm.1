Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789A47F3AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395218; cv=none; b=iSn75OpNmKsTXAT8GckvYO/TVTcJH5gCuSZYwIcZ1wLrytzqT+BLm+lylKliVr2KqECw6N80RqNI16QP6IxatCMrmlKT68+TUQ1vhOzDnqEEyU2TTM8ev2Ut8pd8LmmitRTpK4M0SZJBVLk40CQOsAjhfDudBD/vRdcMZWki7QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395218; c=relaxed/simple;
	bh=Ja150srwy3mFRrkC5Saxj8416lNXSM0AjqAqBZ8T0iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcEFgYmXzDIn4KH7q9ec5gvwJgomHZj8GcAe2FKFZzavbROjNlIzWanCg6+2kN2JDgIEslVF6CNjk09CYEFVtNaqDJpqLcLg0YK7X8/9YsJMJfrUGJMVkW1aCWlTj0l+LoAmCRz7NIUXKHeF+v3iVaXSFNb/6UotCqS3CwNAuVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIyhfN9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnWRvAiM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIyhfN9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnWRvAiM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Q5v674431
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rYzXu3B4dIp7MCCvaiH/6Vgp
	CIXGA5CKASATJDp6n9s=; b=lIyhfN9IMenvjTlpFjdiWkSY8LDTOgpJB4h+0Fqz
	O6um7sqLwO5lmDY+i4jBPIopxm7MrJl+k26OodzhP2K4sIJ4rmcFCuJEaqEN3JHe
	10efQZErtlvnoGbZrrTHXN9D/tY8bPLk2Bjisi/w7xsEAihle8mYkjbIAEyAfEFO
	0Fqs0rhwbtsdiXewMxuk0y41kRgyWMcDmsO5Mj2vvk9L7Pu9Tmp+xwYw1AgAcMEH
	5Ch3/6vTUtVjPILetgLy+U4Ai+XrFVpygpDtEYE2BS+NYeZBs6LYGQZ/npuSNUv6
	jhzek16eOyFIyDBOyayvpUzfx6lHO01eMRL8KmZDS8IEPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs9304-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 14:13:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a07b5b5efso320101085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395214; x=1790000014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYzXu3B4dIp7MCCvaiH/6VgpCIXGA5CKASATJDp6n9s=;
        b=jnWRvAiMs/0zNsRLd9NQI2tXWG8xRhCAbeB8rkGrJDcZLJtn+xPL9RebrDCS85/UYC
         dCyrSr3VdlHcqfLTrjOYFjXrirmByD5/m9WYiuUNTCFEdUnWVm4Kto0OOxpy8wx8N5uj
         57djie200arG27PRJcuU0bs5iMQh9GQvhqvH28dRvkelvJTGDG/o0YzXgZzZwa1VnF1T
         6A/x2GlaEu/INZ7qfCoulFeZ1HJZfolxoUlRZXLSX+/RZYO5WhYYYxTryIY/6Qa7nwXc
         MNnnvseZ0GTdjB4ywuHvibLMOnV71jrkDhmgu4TApOQLi8tXomslVm8oDj6K2wyTcexN
         Puug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395214; x=1790000014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYzXu3B4dIp7MCCvaiH/6VgpCIXGA5CKASATJDp6n9s=;
        b=gHuTdZAKLfRqukWYtNhfUyYZ5s/i78MlS5xcHu4cjQzQQYXJvf2nk3tV9GXxCDWE8C
         BSP0ZtvToUOEEdwdMvKXkiwGr+09FJZDCuNsw+9KVHkN/JAo1Z5YHEPDufNai+QkoAuF
         ipaOUPFA3gXgXSwiSG789h7pm270+pyhSpks5JypeJEAICeXm8fJs4anJbTgnooq2m6M
         z3K95fi5NRywohwIzTrmZtNxHbeaUIOT+0hD0qVv+3LsMvbZsRUhjTAHx6strfilj8AS
         ItqBLVTE9qFWzo6c0bkDHOHjZl/7ekqnEJ7FBSLWWNZJvHjcuTg02/pJ4xUUScdEUvwb
         PecQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgN8KTMlSfykTqPf+pnbfJhUIAcxFdI1qZCW3tQkM8lDW9dRmtHSTbjloSpkQ1TDKJAb206iW3GPBCAk8p@vger.kernel.org
X-Gm-Message-State: AFuF++n2JhgmpBbIoayUZ4X8ve02ecfsq6F5oLXSdpUJMS6tWBvAi7zr
	LkJ1AyV6Y4EaMbUdfdkTmqyCERXV43L5adO9gw0+QQiehl0EM8ophSO0iuL2rPYMZjr+zfmJL2l
	TUZHW+dGayehubIeS0G/xifI4DEPz+3HCMdZf5Lh4oAOCLM/5ugz7zEBRZ3iqasU8qDv1
X-Gm-Gg: AYBFou1fX+SLI7uqDSdTuXSjdHZB37iqMUAyI7sltTwV9CZpCKjyCEF95Kcfhp/yexa
	GQo+i8TbQ+pyTK1LraGcYHBWDQfhA+uxQDQ7vvwtFkAoa/aIueE+tr946VM6J9//XtHnjYs/xJ8
	8iPVcjJGRXu9a8O9tUQhnnVqTAkQzTlLB/2qq1mK8Od4+j9zkxOshmxUXV2EiTotYANqMhNebUA
	1uMhi7fr+5ldhsY78PgFsITKg6qoZcyBLMMK8e5SY4rJz4F5X75OVH1rKeHgAZ1TOV5dT9DoYmf
	Z/9ASES0QfuWbIQBsXc2v8ytpiTgk8W8ASVxRkIKv2VqtGjQBPNIEirP7RAIRg4jXxJQRO7xFp5
	umN51zEtGq2WRy0M=
X-Received: by 2002:a05:620a:4544:b0:939:b053:ce44 with SMTP id af79cd13be357-93a1870be85mr691998985a.22.1789395209415;
        Mon, 14 Sep 2026 07:13:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4544:b0:939:b053:ce44 with SMTP id af79cd13be357-93a1870be85mr691991485a.22.1789395208751;
        Mon, 14 Sep 2026 07:13:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d23b945sm1815295e9.1.2026.09.14.07.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:13:27 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:13:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: avalon.vargas.centeno@est.una.ac.cr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
Message-ID: <fx4mot22jw2wzvd6nhzjejfjip76bpru77uj3ag7v2n6zedk6o@hze6gos4ez7j>
References: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX8YKxzbTF4qeK
 LMLmdKdBln0Lh5QRcffVDt6ZrehPSEcxLu0cQ6WIC3y3QWJ1eYk27860ABXxZ0kJ6NTykcw/C2Q
 CiqxcZHwhaIkjrv0MBuVRtwz3LCsD80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX4I953CygDVWM
 hwhtwSssiAan0l620G0LQaiC9xpaaZceG6a3MW/xwAy3hsQ/5miMc0KSdBzCZ3xAAzfhI9KK+Bb
 2yaQVMRLSb6Yxx64yXdyOYBEkbjbh6ZrEcCCLRWCXnPy6DqbxDnT+JjXjZFZkfQ7wV9ByVvbMiP
 oCBIoMQvxZ45gTHnuvuX8XDw8/dWOVj9QGTzokcKTkYnNo0yXxm53prx/5YVzvgnAEcGEGe64Iy
 j589jJy32ie3QnDOrnLWuJSX7+YA3HXxmKTzpDU4xGZHQupSq3iSbd4qgsRqnuzxowLW+zAH7WE
 gbRwPNn9t7m1oVm9UZHWSAv+ciyeRvZ+A4FUBot2yBq0kMkqPpErimpNJNupjd39q9bk1ISNDbf
 MFwvDox85g7rsWt0BNctnVazg8hlbJxHY49NOK+qdzITM7+L6NAp6TYa5J326iiGcKf+WguvW7m
 mPwjaEOAXgvQhHhkfBQ==
X-Proofpoint-GUID: QcQ1_e1BfgOJ_wjKuo79QiZu_tw-88mR
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa8010f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=BXSMCdXCMYupIW_o_JgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QcQ1_e1BfgOJ_wjKuo79QiZu_tw-88mR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140203

On 26-09-14 07:30:47, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch. 


> Touch input and suspend/resume
> have been verified on the affected Inspiron using Linux 7.2.4 with
> the equivalent device-tree overlay.

Drop this last part, as it is irrelevant in this specific case.
