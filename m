Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2283E5EF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371704; cv=none; b=eiumOR/7RPOCeX0AY4CYf/nn55GIPo+vXNRFQNzhgSRLpmh+tVJlaBf9OVvF+x74Qf1NaYgTBSDH5KOYhhIUng08itVisqsS9crNTj4J9d7SaiGomEgsdYFK65X5JsvsBFoEzt2TwVIZi73QhLn1B3jEmqlxiQdZiilhjF8thqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371704; c=relaxed/simple;
	bh=Ws9u3/CWwGjM80rr0l9Bq2F3GBfaiOwW9ZLAaSwD8bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwPdKrGdBanc9u4NSI87Iv14g22UvHYOeCvt9xp8xXeW805lIrED2IQZYppwHL7VSR+OWzGRnxYD/dpRi0teBcy+yNHtWrqJ7SCZPvkW5uQooEDzEeSHOWbkF7Ar0sMhf1pEr/+RkF8n37hJgmAljuCGy6PmrUyM6QZbtgFpKzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1FIWYpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfzW+KSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1FIWYpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfzW+KSa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jSjC237674
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iq1F7tQsXtHe21R/reAaPCE5
	BzLGvftOFHOFXiCbkNg=; b=k1FIWYpqSjYYjzh5270bSYMMFxigGYJ6u3RvEoDs
	APMn7qEfGT5MUWlFwI+E3OcuhajFT4p22oa4jjdAuzB8DZz6VbIJbJswpTt76rtI
	HggKKkmNnvKFcBXSIjNh7AB1cgPJ0MDuWEjG/+Y1GQR/008LLiUbiaK/WXu9h7qR
	t85f7KNuro19ijCONAcrlb/g3xh+bcuxyKn7aDAC2TqgrCWhR0IYhlf1Z+i6deuE
	wUHtyIJMabLPiTjfLhKCOZorzhl95vleT3Ea3/FK9Kk+m7DPx2z29FoJ9APwZIHc
	ta/KKXT91jRL7lnocyiQw22hmjPSsnQPV4wZtcrGsAnwCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnkmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1bffc2eeso270192385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371702; x=1789976502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iq1F7tQsXtHe21R/reAaPCE5BzLGvftOFHOFXiCbkNg=;
        b=CfzW+KSacQk+ObDcwqNoztXN9Tpr3jtfrI9pQaeIDeBZEpa3LDW7qVMeQo1ZrWFKtg
         OZdAQMSjCK6Ibjhe3jd4hIDdU5+l4XQLJvnHS2iT0i/eVHahq2p92/GsfGeWIyzzXJVy
         YxHHLRQeCEhSKyTWRdCpESNe5IN8rTfIH5m7P6YnFKbrr4U5tgWtUlAVKAT8Y71iVtZX
         b7Sfz883IWaOZc6E3wY/S/aidqfC3egB98ShybCS6ZFzLiEqyzJsbvhnG/404o1NYOMg
         fjR2XZRywh7BZd4YwSPHHj6VyXv6GI0RTbLrKKu4lG5V6IWS6NgIIUCWeGn22tuvQiMM
         LSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371702; x=1789976502;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iq1F7tQsXtHe21R/reAaPCE5BzLGvftOFHOFXiCbkNg=;
        b=EQ7xThpcvsk7bu/JnxIsrfYopl6cvi66yhxlsItGtq4DFTJt5uEv5OXTfu4qA2lV2W
         SaDeG4TcBa0xpoB4ae9GiBgEMkktuyz7eJWwM9GIX5RaD234QfvPLgWMrzKvNZIVr8bi
         heQLgu1WoGb2tP+eWTfadMgNGJy0bkedM256ymSZcmJ8sGS2DKHmuMTzHUgeMCpRDRIp
         n6w8tddPaZ4JuDPZDA+J7DKzBfkZ+JrjSogEcqP2Vn8JLx9ieMD5g1PIol4+o3NQC69W
         x7xX2zeyBKjr7sq0jKlBINnE8o+vuNqrzQLG0UgT/26WEz4eaBbjeAssr54/Ikgpitj/
         Kp8w==
X-Forwarded-Encrypted: i=1; AKwUvBzMe8ZgD/dy84eKjhzY7WnbnknjOCwkVRrSCmv/bvU1jA1vI+l8tocFTbY0WDC7qVGY7EvE3HiFGlTigP7E@vger.kernel.org
X-Gm-Message-State: AFuF++kaAfE7vvI0+JNLPZdLYSXKU8+Z715E15ikBEP0COoGq2uT22sz
	azjTUvZfNGDE8wrahXL2GN3ABGOz6Vg2WYfTJx082ScfbeC+JvHE3szv755xrb078jyosDTMl6V
	fkI9SUBVDjidsEOshqumd2V/HXZ8b+45WwQdFyiVbCEu42mU1CbfQ9awSciKer6fxvVHwpa9PSF
	Qp
X-Gm-Gg: AYBFou0GOCCX2sbVn1LmZsoodILP4EwBH4e2L1FwHnVmfJ86O46r+/9yWIPOzHg0vWf
	8UZJ0By5oxCrv9N0WvGJ60oE7DliIe7gIYWrEugfoMwo1bqOI8G9MB3Cf+SyVFAvWN0jL14j/oB
	7hBKcPnGMMQVbEP68RoYSLFiprzD5X1FZ7CnTucXwqjFlJZBTHEpccoGke75Y18D4BOl/DqYggB
	50buAAv1qXNbVwvaaBGJnN1ZgRC15ceMjNeh45puUxKQBB+lIluT2d6Ex2Oxf3OIVleq0YBH8Qw
	ePr8yV1UHiyiy+7MZP74qQtDvYNgdtCIRFEoTNKmIjn1kHkw341OhYibnEgM2XRoQHdm3MVNP8v
	lreR0IKqLBtx+ww==
X-Received: by 2002:a05:620a:1983:b0:939:a0bd:2c95 with SMTP id af79cd13be357-93a2973f678mr187346685a.4.1789371701382;
        Mon, 14 Sep 2026 00:41:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:939:a0bd:2c95 with SMTP id af79cd13be357-93a2973f678mr187343885a.4.1789371700920;
        Mon, 14 Sep 2026 00:41:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7723d458sm93064255e9.0.2026.09.14.00.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 22/31] arm64: dts: qcom: monaco: Add domain idle state
 names
Message-ID: <3enm25celxcu3zzitfuiz2p7fo4f2b75jcpzg6y46z4fx2tutr@pbipgojr6ehw>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: 01mVrdz4IBUMCGP7Cx-i8dv87J_mzm5x
X-Proofpoint-ORIG-GUID: 01mVrdz4IBUMCGP7Cx-i8dv87J_mzm5x
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7a536 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXzN5J762qSM1p
 748yQJ7s9zeAr3mx2FhTLqX/t/Ce78MIUYSRE0WICdm2BButp1KnlBjbkwH7u49kdAlDooMFOfh
 bt5q9MwIaaiNXa5ReVsySEhKOwlL+iU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX3w+CkfebCvQ3
 jPZ4+KKvBzReiCnKUcXEJ0H5WkQk+AeIKBPdz3RVXpnJ2J5o/lHL14EwKUYFDYT6NC7PutjeyYQ
 /HaeQ8JBVIaT988aatEdrrqWlMaBM1+kLC401Gcqp5qX0zRK/NKU8EH8TUNvM6BOQaPQFE7LsZl
 tuB7pFVky+XLmdV7I4K1TlQcRvokI5k1tBNQbn2rXZpy6KSSqDd+avzz95QgNywsRHlCaQuUdoW
 2hoXKtEBcgfUsJCBawTz3B92F+G7nhqQ8vtl4gVTRuyXkLB7uVQPB/mawiRiFIm0f+whxqPOw+n
 mOnZCQqusbcrk/NYrbvEWR4ATNapcrb2QDhIkVxIZK/WL4SNNc+UB+TlkBcohnPeYqEiCY66FJh
 VFvsmdO8EVT1kuJUbqRupISJ4NVjxnx38qbNUsH98aB8/AhlwzbR9BCKNCNnq37hrqot6i2PYwu
 4qfHP9s0cvR6LkyBrhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:54, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
