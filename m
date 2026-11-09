Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244987;
	b=ehsT0gOZwkYmoKGKlfbnFQKTDdqokwCr4J7Q4Q/3OIuXIgZ+OTSORVcNy2FCuGhlC+cr
	 gX/YYpdvZgaEInGt7D/i+9PL3PQOfnhNM4DtxlEyT8NGPwcGFhPOoSxYBRt0I1B8IQEaH
	 8l59y1GBYUDv3eplhA4SiLVUKLPFRAnSUMJeZvqnHO8PwclrfHpL6GJI3VuS4CaHQnul/
	 vhjoTh2IWp/P+Atj5jWTmdiYuRLJn7iHRuEdElfDGi0ahQZeQWcqmKvvh4SjMgM4MR+2I
	 kGg8RfZOEWCQXo494PY+Er4zJyeNpVOqKdZWf7uWZ0fRFdi9bmOIILqChCR3D4YFkdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244987;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ESpNqPWFmAnteWjwoKztvXmxNw7OtWFA0O3xHpnl6uY=;
	b=SadCz6zei6/3VYc6eWA7iMgHVtVodEA/91XFoz+UDmYvqMetqrT5kGsMTfPPezKNZcd9
	 sDsNdAPSfNoripVXaHN7E4apJ3XUGn37icR+bKs2ocdyXvnbXZEQajXu4KlJv3dfxCe0X
	 WesCrmtkV0H+aNOBhNDs2Up39yOW0cua25dAajwlGz/PRFoFGPspdIMc6XGjoxZ4a+MNx
	 SUEO5x6KRG2LohnmXPfUmAefB8lOHkoLIwx+soifl2N0efuZa/q4OCxlSRRBuX94gXzv1
	 4JjfwZlswar4Pv+P03tVTJ0Ei2ZmGuZFLkZL2D2JEY/IzzO0ZOfRRVfbgruLncMn5Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzAUolCa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i/ZiQwWf";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2E8606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 17:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED2E8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzAUolCa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i/ZiQwWf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HHKnR562024
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 17:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESpNqPWFmAnteWjwoKztvXmxNw7OtWFA0O3xHpnl6uY=; b=WzAUolCasX54848V
	HuUxgU6/inq0QOZTW4Lg15jvNKwou0KS9bzOrM1g5iys2c4YFa9KwgY1v8gg6bd7
	w2VFdNc8WAe91QPZlxP/zG0iI2yhUnD2KRc7XeeCAu/3/AlaWqr6+NLrxnDWJ8lw
	UGddukGzRZf0OzNExX3jSHwuiLjbkdoDWl+CE3v9PM8WbJfedlx9Hvjwknt7pAob
	czydbh1TXznM/DDlHVPQIYxXQT5jpqdhHuKfQc9UqdaivNPArsg8aP9hjhYvvjVf
	XNjWY/pE8kT1ZGLbO/ztYCvkZyNfIDVhEAL6UvP5glOu/xcqvrCM4048vFeM1ReG
	QD7Xgg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydhde7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 17:23:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so1968549eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794244985; x=1794849785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESpNqPWFmAnteWjwoKztvXmxNw7OtWFA0O3xHpnl6uY=;
        b=i/ZiQwWf1TukcCY+j/JfDqfLjqkp64UPWi2s/Xc5WI7+uj4Pl4+iSSiBQ3MfzyacPl
         Z0++dpfvsEWmgheG36GVy5d5YN4kU1au61+2SzFDvDfM59OqBwznLuJtVNTfMKREnpMh
         yLmHoz328LYJGZrMIdsjCTmWtlB3ExmDmHVmwctrdoT41HvgGvd+eiP0tzi1MCdxDgza
         CIJb8yutsC84d5V3OAmlJNenFeuQEb1gd8lf+WdqUjbFpfmn1OauMRmp1bnCbR2QNguk
         62LLLTFO0fxWbGM+bzMSWnmoRFHIi4cZrwYiIjQcSW/5wNqHBoEbkYXBoP0IrhTlw5Ds
         GuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244985; x=1794849785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESpNqPWFmAnteWjwoKztvXmxNw7OtWFA0O3xHpnl6uY=;
        b=KcdTayEBFaMSA1TZP5OX+/KuahFnAseeIGgjyImaPg/PblYS9h1lbWFnog5ttkZ1YF
         Jm6+2ENYkCABPMmihbiUPV2kYt85N0Asui4meL2v8m7iyiFkjXwSQDhIjoNtU943+9/6
         RDnxNoe9oQjckVxwVdFoh4RhM9S+/7rLoJuJ9WLJbXV2HlyYuwPbtlD3sBGfup5cRwgd
         t3zn1O2ThH/2DmfrV8rWrBCwjUu0HbzegsKdvZ9kIKbaW5VaqaiD7t60XbHpA553MCxR
         OeVKXlOrzvD5l3WIshROUjoK9/m1ODBBdstjY8xGWMCCLqT/SAoPFcU/tv8MNC/eHjDZ
         fwxA==
X-Forwarded-Encrypted: i=1; AL+hErFkIzkRTnwnTcipyx19sNcKrKuKYiWqMltEEIaUU5CgFQtbGTMPGjw4/sQvgmYsnl7C/yl0+6tnDktZ1cQx@vger.kernel.org
X-Gm-Message-State: APuU4Z+QN+AfhTRpiWEl3rIA3zuD3mRhykJEZ+jHBbAS12+XLHpy17O8
	Anvp2syo+u40BRDPVkFtbgt21XsA9FVxWDW5M3QRMLNj4m8rNGBt8VHLSIwvzzyvMZA/Fq5jKvR
	KJ2repRIbCdY7dygqdUo0khvBT0gWAnyjlYwarLStKU7lSARe7fuj21vroSFQNqGw4MN1whOarh
	z0mkg=
X-Gm-Gg: AYBFou0167RWIcCgdUVIVoXH+4LSl1P3W5GOyw5QzlZxGvKJssqxPOhvnqMww8+GgQX
	5+3mXRNIV6q59YfoOx4/m9zR15W8ly/+Fc2Kvdj9o/xP3IIXxgp1TYeb9cCLAOx5pX+/Rll7KCK
	kCooymevQ1KGqC5I//ZeukU6P31WPWy7WB01hzLnvuRGsIRVqX8ad4e+Mzy4kcLQnqKHBbXeYX4
	pUJ6nMES9E+JTYDZMklgQRaMJy1DC2K/6pKhwz7HdEce8RwQ/E54BREMf6BQ3GJR18WuIgoPTUO
	sEnIb4A9v+y2J5v2BIZc7IJvfXvdFOJ8Za31xKI5MdNwu6g8wIWJHjmBfQxgkxgRr0L4dnpnokZ
	bAkOOe1/FvCTteFfZb9WZ5rJE9KtB9Ygt2Z1S6jE5oyCVmkbmu31vOdR8/SYFzRqpBXZAut8HnQ
	Xsab7DYZMu5JpxcURptpShmw==
X-Received: by 2002:a05:7300:fe83:b0:36d:37c4:3759 with SMTP id 5a478bee46e88-37255b4c78cmr7781300eec.18.1794244984650;
        Mon, 09 Nov 2026 09:23:04 -0800 (PST)
X-Received: by 2002:a05:7300:fe83:b0:36d:37c4:3759 with SMTP id 5a478bee46e88-37255b4c78cmr7781276eec.18.1794244984092;
        Mon, 09 Nov 2026 09:23:04 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm14854328eec.4.2026.11.09.09.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:23:03 -0800 (PST)
Message-ID: <c39ab64b-102d-47ca-9cad-f590488ee2c8@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:23:02 -0700
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
Subject: Re: [PATCH] accel/qaic: Harden checks in BO execute and wait IOCTLs
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20261106194434.4062205-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261106194434.4062205-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfXz9q/kOWnV901
 pjEyRMqCKMVGlhBuJgO3+wTaH0yKjTDgATnVIXPpuqY/LJeFBAHQtg4uw5pOPOOI7ZZzxh16lXJ
 4Eve+4z+jTKNSx3W3bzATLt/zurHyDI=
X-Proofpoint-GUID: DMHiINRR9Zz6o1HssSVw6X6ytgN419kP
X-Proofpoint-ORIG-GUID: DMHiINRR9Zz6o1HssSVw6X6ytgN419kP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfX2p5iwpIwT2Eg
 WwYMzzgZ1B9FmXm+PmHiow4w9IfddYqTe/hzQucheoVfAE1gYP0WEUn81PFQXL18bSbmZndjMFl
 6mUmJ1+wdZl/b3px2yaRgavR0dROfqOWs6EfrOsy/nRujR/4Ja/qwFAzfBdok6czy9d4AWH8h4J
 QPeXvwpuV527a2+G6sYH7ovs1eTMvGDsDiS4oDf+FvU3SpNpfGztsi/LhFhQwkz6rzzIoccq8LD
 ZVH1OJSms9VX3bqbH1QGObzg+FAE7oayUg38WT/TA5hdI5izr2ieEK+QPwNZo91MPvTME5L8XNt
 70lnbOFoAcNJacqZnHPLW2/1gx8hJDZkIT+wDw0RfWvAAwYaQnv5M0vRSSVLCC8pEWKgrlzTvL8
 bHiwzhSjdxZb9vRXaMBRr9kzxfONI+JbrX+0meo20GxHsUCf+mRTmDcd+4ttlejgkoxTjEXx6xT
 SfIZtaitdO6aKf6JIuw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af20179 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_a0-uAXI4ZKTf_5tdocA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090069

On 11/6/2026 12:44 PM, Youssef Samir wrote:
> send_bo_list_to_device() does not validate if the BOs the user passes
> through DRM_QAIC_EXECUTE_BO and DRM_QAIC_PARTIAL_EXECUTE_BO IOCTLs are
> attached to the DBC provided. This allows the user to slice and attach
> BOs to one DBC, and execute them over another DBC.
> 
> The same case applies for qaic_wait_bo_ioctl() as well as it neither
> checks if the BO is sliced, nor if it attached to the passed DBC.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
