Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007852;
	b=JAwHuVdvgdMw9DBDacOqYJQW4Cz6ROnI1X8p+asWkhsIoc7P0niWXZ9PQpVpFQb8XRLH
	 wehGGk5eTpajOWPVBSOXWqlingkfVUp4tHSWqdfO71zb5f1LTcSXy1QkP5RPKUCvYXMYf
	 /npJJy7i8vLf+GQgjSeeQgoGj8UymL7pap+4CdUaTKMA/iKSn8Oq231PmQssBBTON8r3I
	 NzYCx784Hbdfzq/hNwa038hfUymlmJFXRzKMS/kT1LnDmLUqMMZdbjxJnHyQk4erYrg0x
	 KG1VwTpl0xyJ19Es9c8yVh1KcnVo/BZNV+KKGiuO8GIJodHqwHbx3LmtrpIlmMuNnsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mhl0TRrPmEw3OGZE76My/tb+55cAaHaJ5x+X7Z5JALU=;
	b=FcbK9HEYML+rlDYXJRW1CqYyPcVlWeVJQvd8E6D5FINdKoBzpBYjqgF7alh5Gbj5o3J9
	 YGeqMqrTsIkdHd3HDIyi3GytilUUuF88I2mSu02Xn3vnMfcB96ThGvUtyd/Y7yo4CXbWO
	 OZk6i9wq8GStsqiRBrX6QrIRaQE8LUDx0zUazZceuWLXWHXnuXDx9bKDEMaNMUDiS4/ty
	 YekQMKi2VnzeCdgKf4oOQ1iVDfpQaE4ecpGs2B5vhr8D5Q4mK6VTwKW/LwCLMtfUYQ+Q9
	 O2ySTg78jM2ymrjZd39bWY8pECxabLT+EZFfGml7bb+k+IbHHMKNB95aFyL+VmZgG2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMOhonFV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Zz9nVuR/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E42606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E42606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMOhonFV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zz9nVuR/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1mT2206204
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhl0TRrPmEw3OGZE76My/tb+55cAaHaJ5x+X7Z5JALU=; b=XMOhonFVX7ScY582
	xjnv0tMljWEL1QoQPCYubLs7jtwXz34/1RaHk38yw0W50a/qZ+a45yqXeeHHIQyQ
	YQTBkJbCTmnvldsM+3kZhICnglxghiTPSOOyh1ACpL3ofk1RBF7HeuR1F248lZOy
	LeBWB+cQgLMWx87ob+4gie8CIWoybncMIm+9azR52JOIzxMfGgXpsWpSoMxm9e5L
	iraXlyxkJFjd8zxnEQ8QF6e2opa8/K07rqKB/WxPwiIgcSZyCQ/MX7PxwGOHOvQy
	hUJdnQ/DXFQaixUsJQkdcXpsi5WQEjb06AFOixm6mlPdz+1GfQySxi/1QLoAMJn7
	2fvqWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunrky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:44:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso20287185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007850; x=1793612650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhl0TRrPmEw3OGZE76My/tb+55cAaHaJ5x+X7Z5JALU=;
        b=Zz9nVuR/HZ5/ydEzXtWXkjWMUPC2GiNEnpn8r3Wp602nZNoQ7YzT4aCH4r1u0kTvL+
         FfbWf4H3ITZmU7l804afFnE4y9ZeLeDix3s7hK9XTRz0sl037P0+lwie7dVbPKQ5peRj
         MWXMGFZSOLmQYkdYOApl4jV1U+1Lxa8rzuDNEsucsOPBYMt2q5YgDPFd0Fs8BdFpmYS7
         XBV94bLm2oyDMa26IcDcihasrGvLwM7BnYPpIKVtYxGNjRTL8FmEWvwz95LUaFJkv92X
         fB+JtsswTfdB+IKb2ugY6MYNfAXw0/nu8K+G51MQaQX0BLejVd9KLkJvAZAztipAb2Ra
         XaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007850; x=1793612650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhl0TRrPmEw3OGZE76My/tb+55cAaHaJ5x+X7Z5JALU=;
        b=zH+vZvJJTgrAPgXhOJV3aOHxIGHeE6Df9pmk7w0kyZqp5Qnu/T/yjUHvsf+DvyhU/B
         aw2awZdrMUu62zXDuhYj7Rg35andVbkElt5o9LkZ/4X7cYvYtskW5O1Qmeg0IN7glf5u
         X1pYT5NXvGBM6vYZTJYf7I4rXjgJueGJAXVTmXDu0bM7trcShGC5NMi6W26+Io7+RmZE
         oJfGkMzzc4vpvQLjsSiwnfQtRsx2AxkLFVAHtfmyuZKCLL7cudzRMRnfzhLFgUb6HE4Y
         kJd/95tOYmtG40qlWkqWkCt2JcSsXiUZI2qiuq0lUFrd/nyoiwuK9k4a7MgmsnNhez5G
         GuJw==
X-Gm-Message-State: AFq9FYI9+sV+kBgTKsoCeix75LuoPGXuUV8TYBtVvQZKb1Q37PY8I3g5
	JhE+kHcLI4SsqCd1bMqg0zFRmgjRymfea+5b2eYGFTePv51MDhiDJ1RdjcuPg7bay7LKytO4iGa
	FZj78gyGnis/NVUeumbb4RdJ3BVUZk7Q2vDUiNXaQntAw68UXRWe5cmdsb3QSiHk2qCwp
X-Gm-Gg: AYBFou0dqfj52z/xbegv3WOF6VRFwvks1ErbRiuJC6LXiE6pGxIEFJxbS2LSS7EA/nO
	z3hSw5cLGdsQV9a97dwz3QsdEc9pxAp8H4CV4sJ5E4rG6O2mxvXT/YucziX34yiah/BlEW8dFVt
	ROTALaCRkdSNjCSgF3fk03FlDqHmJ6mzFjqrMeQa+VXnvYbEayk/t1JGNANSuuYSDHyDOIqX+wZ
	9IEht4r6vWlwQvKlZahOme9nqUrWQY5MBCUCDB79jBx+oYRnlt6URSd6RVA2vQdeZN6d6f2MYdr
	pP6Wh0LSkddVzYyYzFtmTfXUWXO9iarecg+Sl4aL5RFUdKH2oJ0Cq7rQnGP4Pub3vnNve6Hs4E6
	xCJjsh5gKZ4KwOaF0WfDfDg==
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr1004499285a.6.1793007849808;
        Mon, 26 Oct 2026 02:44:09 -0700 (PDT)
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr1004496885a.6.1793007849219;
        Mon, 26 Oct 2026 02:44:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984b61sm3532927a12.25.2026.10.26.02.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:44:08 -0700 (PDT)
Message-ID: <fa95ecee-e6e3-46da-abc3-a9e0e6be24dc@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:44:05 +0100
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
Subject: Re: [PATCH v3 12/14] drm/msm/dpu: unwind a failed dpu_kms_hw_init()
 step by step
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-12-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-12-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX3L49LNkWz0Ok
 34CYB/eMvBcf4tbpzycmUrzlFdRQ8KHz8rPUneE9X0fGFQLaIoeG+otVYxlWKQoQJ0pXY+p1Qtw
 kQ1MYyQdmb6XgwKPfGRz8Zs7k8570mwV0vXcdpGBlvKO4pnX2z3QGOphSWaZCmGPnOYgL+UDiAz
 r/MNK6d99HlaDk93Gb/opQfpHhaHAQrpf1lB2DhtHxCvGYkkiEqw54zaMZ2ehTEI0aGKe+V6Nv1
 PbJ+T1Uh3wbOJ19Wh1pK4+HN2YAM4CmM3vu5CmAHn4Xg2N2S8s4ZLAjI5KVzAEzHcKXRcWJuAuv
 PEG8okYhJkiZTxsloGcBy2GtNXXSnZ+YFAFXFZRSsemhjW9cTrEpIub+xulTtUZxQWXIFNDSg+U
 14zndh9Kf8i7G44aIjUph5di4JrITGaHIZjVRcLHiwf28KT10x/LdR2tUaGR2kQPna3wjLX3OIo
 YIEfeGKhjoRmAYCESTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX1U/HxF71ZEew
 FDthmAW+IL+7kr0txZp66ZKKcUxf3123AVO/4O6EvkOxun0EKSuArVdcQiiJcZ8dTu3eNQVyTZu
 Fc5SHpAj4R7ME20pUxy5+e8mc5SWK98=
X-Proofpoint-ORIG-GUID: GOM6GNhtO4P-uin97K2-od1crrNDr5xd
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf20ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=f5Fz61LfwqCCiFe2G2kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: GOM6GNhtO4P-uin97K2-od1crrNDr5xd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy(), the teardown
> of a fully initialised KMS, whatever step it failed at.
> 
> Undo only the steps which have completed, in the reverse order, as the
> kernel convention wants.
> 
> The hw_mdp, hw_vbif and hw_intr blocks are allocated with drmm and go
> away with the DRM device, while dpu_kms stays around for the next bind
> attempt, so clear the pointers to them as _dpu_kms_hw_destroy() did.
> Otherwise dpu_runtime_resume() of the next bind attempt passes the stale
> hw_vbif to dpu_vbif_init_memtypes() before dpu_kms_hw_init() sets it.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

LLM is slightly curious about not clearing dpu_kms->catalog but
I think it's fine

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
