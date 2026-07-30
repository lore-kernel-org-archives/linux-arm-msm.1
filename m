Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2AD446842
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429320; cv=none; b=q0QiuJI/OEEW10FA0aGL66jjs4FszOp77n35NE89W4of4RXX8ofJG2IzPERHAaLy07Cr4XsWckjbpgkgMRJFqRpeYEXDLutEAAllMgUOtOif5uGLKujUAcnk7EP9bPvJ2MTZ6BSJ9LCzhX75qoqj+LVpu/SETeRRgRvFkrV3cFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429320; c=relaxed/simple;
	bh=kNFoGkto4YUV+q+kdaTKRfPJFFbgRIEaJOcb4pYZBDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1aldiL8JZN8uw/UMRx0c+Xo1DuUdyuVGvEQ3R1Lj9Z/klp3PdseFJOOxQsC8WUGhruZ3h/8KJUAFvbjdOwmAuv+7xZMWZP8HVQUa3TUS4M0+1sSTXxnxrXSB6icGyFYBJOE7v7oFpwT0UtggRpU1aPlky4KZAArgb0xKLKbLuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U25TYe6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGREizHB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U25TYe6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGREizHB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWR1o1835279
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOj1vVWOBMo3uZFHaAul+1fIzuwnLdxwYpZuOgVkZW0=; b=U25TYe6pBHo5C5O4
	sTDYe80skS4vVPNROe2VqadG1sf6X9st+q/yhFDDUbef/vBJKOOj6TZN0VzURlGh
	jQIK2L2qIJ6K24D4MKubaX2EJoIApnhL/kMEg7eaO4AGHq3617yJfRtHHkTjTLFg
	11ca/3ujt+jAy0F3ZRtU6wwKlhpJtmX+k1wHaZt3aAHqIOh3t8n5RzPzFROeufV4
	A82X+DlHyjbbXzv0M3TQsaTxIBItuYB6mfldQkPexiJfAwpWkFAhd0WdE8YcUTYY
	HREB0UpJXe+MNtrts9UyDawFTI/sWSguY620gIWzSfV5CVChA+D9r1nJTlwYfu35
	8fJIvQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8gy0pfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:35:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-903694fd3bfso132786d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429317; x=1786034117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOj1vVWOBMo3uZFHaAul+1fIzuwnLdxwYpZuOgVkZW0=;
        b=gGREizHBSUfUZqqdk+GykYPj/B+2RsAVG96H1lV1Wz9Z7IbfCNVhnhZlDmGcwzgCYI
         qW36VQndjDnmVlHWJqKJbVysafSbpALNuMWsJ9DvybLqB8JL56hNVSlw7UnOiZEMlf70
         ygrSMs0/VQAprn8OOLHih4YLweKwQbDDOxEzFMLlqM40Wa56jL8jyB93BJ/vi6cSSqPE
         Dyv27Jet78gxNI4u3Gg3hsUfa13/1EfiBqfCwhZ2zaNiMYXSmiimCBHeSApm2lwlfDFE
         UCMZiBi/2GWuRMQBiOwmSjTZbxSVqFncgbTmSDGkmwz2embZYhoJbcMKpRH3p/UnQmiE
         O78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429317; x=1786034117;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOj1vVWOBMo3uZFHaAul+1fIzuwnLdxwYpZuOgVkZW0=;
        b=DZVx0k0e++QcQqYxqKpxdYX7mYAI1nZKCxS4Wv4yx86cJQjdzJtR3JG34L2BDJ8NGw
         4eHPevcftstyPCIQDhqIuIC4EGtDoIy75QZRd/MAWTGRj7jB9tI+vZaIS/qDhqnRalK+
         X7yPwSQVcQ+E0MYBA3MVEqOZDR9EVnmSl7LDJAfSD3XPHXd84aOXKyfBYK0r5uLbBWDF
         hFFumyHsiW15ysUQ3BKY7fC7ESNXyDQmgsb3lGqucO/mC7ALg+nOOu8m/VY+HXAw26Dy
         4BCgPv2k/1x9vkwrNs+Z/FD/VwqxSVVU1S98KiKBVd7hjk/x3RMO09fODXrPafu8H0vr
         S+OQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFCvXzTcz9XNX9QKrOIO5O5+6h5cysHF8akSBixQGDquja3F1fUgdJXDDg3wbLI+m4YYgmsS7+QfUE4tjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzzWgbyitxju6aeuaY26gZZHtAiN+wkufXo35NTAWeN95jVF+ro
	F5pq9nyJQAIMvYOG7iNvsEr37FF+kcvnJlACj5XLAroNtxzxeFswxWpRJ+q98s8Yw3tVKL7rViP
	2anzvHYhCRvwCEb9d2zy7KIDulU0i8tHkI1h4qwXzzGlCV6AEsJ5VX+txLEbhhToCdlw9
X-Gm-Gg: AR+sD12jfa3uwIy/l2PL6etUpnDFlnQwuPgqgQKEIAFIT26uxvXo/XLW0TPQQiOONEM
	vIICgiouDzd+xd/wE2D52vu2/6iDb6qXx4ooZFcFJ2IdT22QGgx4cGTv6FpTC5xDjYf0UILRFxN
	m90hYe1u60Loug5gt3k6PSYbn5mzl05i6Lr5d2Of5wizFmCEe6cGZDLXPXuzIaRoPeswRPiRM3P
	NQOcjOmdmr/6NxbGWvTi/H3B4HyZcqV4hMGo8EHwFaQUPV+IQvCgBnx5fSB9D1wDfcsoua7Yz42
	SrxTt1Lyl/9shjsausOr5Mg4H9AmJBXEsU0QVDH7PfUbRuwR343BYD/wvrYB1FrVZLhrj/XJX5R
	SN9is4DYHdI3fnA/zarI4KdpA
X-Received: by 2002:ad4:596a:0:b0:907:bde4:981e with SMTP id 6a1803df08f44-9083bb803e1mr12195186d6.4.1785429317255;
        Thu, 30 Jul 2026 09:35:17 -0700 (PDT)
X-Received: by 2002:ad4:596a:0:b0:907:bde4:981e with SMTP id 6a1803df08f44-9083bb803e1mr12194516d6.4.1785429316599;
        Thu, 30 Jul 2026 09:35:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bf2c99sm91770266b.62.2026.07.30.09.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:35:15 -0700 (PDT)
Message-ID: <d1b19f25-c78a-40b7-bb1c-d56cf51b6e44@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:35:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: iris: reference count video instances
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
 <20260730-iris-fixes-v1-5-413d6cfaa8ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-iris-fixes-v1-5-413d6cfaa8ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SyNvaxFJTA3zEgQXWtoGsXYmwd8fVwfI
X-Proofpoint-ORIG-GUID: SyNvaxFJTA3zEgQXWtoGsXYmwd8fVwfI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNCBTYWx0ZWRfX0p3Nj+WwQTqF
 mF/ma2n3R07PAVS4bcERjioaQ8djlsuBcTn43EZo7D8mphGCAm7BHy691TL9Z2glv1WWZw3aU89
 cC7fgZKko8ovexEd764DHebHlCAk3rU9d+ZghTjjiZC6asakoJ5Pjf6PeT01ynmULj1gYGRMDOw
 lLJfcfxbffpdwY7X8QIkoLGJ4A0EZMWLe08tdARg+ZdDUlgP5SKIE++2KTmYcPxsliHv+p1Ypdw
 /BLRDJi7URc+tCH/QdjVbBhLddHS7ugTc8XR1NRXqp/7sC2Qd3vx9ecu3l31yaAdU5rEu8uPh0N
 PiQr1vfDq1nLrl/M8K8IqdnMird9YFxEWzB38Vqh5WnICnolGIHWw2rEdYPU5FpH1eiiUIhcIIC
 w1Rwsjh8SFdlFbXqlie3VuFDQ3EpGl9V8BbI5D6qRZoYqDWl9/ex/xSrGlcn6waou3yahUubr1A
 c0fWP+Vt1K3MRHcL4uQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNCBTYWx0ZWRfX/fgT7acEteSN
 rGJZogRJbj4GZSHYlaIw4T0Ck/iBc7500CsEMs6n4IUj+UY7IfqIAa/TfanuoAiy6yBQf1IcLBc
 GY4lKY2xO89u2jym8/XqRHmcF/BspLo=
X-Authority-Analysis: v=2.4 cv=MuliLWae c=1 sm=1 tr=0 ts=6a6b7d46 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4zhTdlWgoSH5eR7NdxQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300124

On 7/30/26 5:26 PM, Dmitry Baryshkov wrote:
> iris_get_instance() looks up an instance on core->instances and returns
> it after dropping core->lock, without taking any reference. The threaded
> interrupt handler uses this to find the instance a firmware response
> belongs to and then takes inst->lock. Meanwhile userspace may close the
> same file descriptor: iris_close() removes the instance from the list,
> destroys inst->lock and frees the instance. The interrupt handler then
> operates on freed memory and a destroyed mutex, a use-after-free.
> 
> Add a kref to struct iris_inst. iris_get_instance() takes a reference
> under core->lock, so an instance it returns cannot be freed until the
> caller drops that reference with iris_inst_put(). The instance is
> released (mutexes destroyed, memory freed) only when the last reference
> goes away, whether that is held by the closing thread or the interrupt
> handler.
> 
> Fixes: 38fc8beaba55 ("media: iris: implement reqbuf ioctl with vb2_queue_setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I think your agent didn't get the part where it can never sign-off
for you.. or some other funky combination

Konrad
