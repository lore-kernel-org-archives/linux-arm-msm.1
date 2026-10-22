Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659889;
	b=az/SGi8hK13VKZPYuExmhOlZPbwnG3CCNkcGAou+kGFihjJWqTm2Im0eMf1UWXTHRrLu
	 Bh5HzL8yoEb1ybGxcbt+uD+XQHWi2uui1ynAZYs5R6Iugir0gAlVVYBNJvi75SQnlnYgb
	 9WSd+5XXx1rtLriJOjSoRVQl5RXppxZajPefhjmzgusbCDLmc9me4EKDYeeENG0uHF8e+
	 eB8EQFEv6JvoypLD2g7fSVKt2fTTFh4rq+VfardK+aVtxMMm7LDlB34xdnAE7Qt4h5IaA
	 aksjetFmwo/nVl5evfvQvbWpPynZZyewpOtXJzTeqmwij1GwXu9cxwDMJgaihi59OhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=;
	b=YM1/mPLPuIOsxQCTV1B/Iw8gZgARmwbxpo8wZbqN6MFtDkBbSbnHuhFEKDB1kySEHQ5n
	 LMVqAL20VvRuGREuVHV6qjchLwe4w3luSKnlkksUQZ8af2nJreUwL8X10sL5v5pOoCe3U
	 tA4EtnP1BZ2+9VxwbDJpUqmqDsuhmeVJtm/zeM42KSblB9q+iwHs4LABcR06ekSN6wCjq
	 bDqcV1jX85v8oGRJ6c42g8+cc7jcjcFyhe3PK3s1nsLTMtu1fGKGf+lkzowLjeH6ZUuWK
	 Sw3pNnyCo27ig6ETncJuNTRBUoMXHkvlSpgmo3fNklARVYnNHrFqiDXDmqRDNsKm2dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEbChZoX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPP3IIuE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C793606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C793606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEbChZoX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPP3IIuE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705I84110621
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=; b=QEbChZoXe8SUQilQ
	v1DuEY5ECmVDOGhoRCzNdIMh1N/Ryw3mScFCEO4OAfzCVJg2H/Eg486DW1hyHz21
	0I4WgaeTiQq140nHo2pObmyJJLDzs0u6PQW6oOA758cus8KQJIO7yOiNej/0gNQw
	h6VoFPyBWUlrnTCwMxjKua9/+RfFvDDGITtAwqe1YgzerP7TtaXdLNOkeRnl3LkJ
	ZlRJaAouwQSY4pJCYRrGG5rulR1rKvligTj8SUKbgxnDqRaC8J7ext4KxptOTpHk
	TN8D8uaWbFlpq2F5um8vn3EmbsS2AicPl8ez9B/bGZOJ7C3E4AYur/WHbBXX5hWX
	6Q76NA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:04:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso42008185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659888; x=1793264688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=;
        b=MPP3IIuExSnL9EUYNbx32OLPP3d092SqUqiOOPWCXf8W3aoQixWjKmSOxOtzZzbjiq
         QLlWgfGy57rZq6bN84sRAUIkQSkkb2VFVHPyCo2f2SXi9MjYTka47NPEGOUlm7aRPRz/
         w110HqHoXDq3jUqqhZkYUZ7FKmuLWU1FL/kM9ZpdurJWnjEBZs3LHF/ie++l9D17q4BW
         T6dUle7C4wE5tCNm6mlaR6GefB+dpDtFI+ITvyPL7xvFnMH3QrZjL7OB97T1SqIx1bu0
         Hra2vsmdylKwmF+gKbCMp3szY5jw5mBf/TXa+ay6eyCk0yF3vAQpA2IDhQ2P6/4IkWhB
         MKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659888; x=1793264688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=;
        b=gb+0bdrW2L42dPrzsNzbTdlfIMM6yFsYeyGeVW/byFIytFsTfiS88MNN5yV4lCTVJi
         w0dBEwjx8RkNMSuL5BxivwH3xBoS150XJzvw13e1M1OC31beMZCJMP2iyExajkoPIOFM
         RbWYFpVBzHQtGXmPoilO5Ykrf0igSbtXoELOCfgJrPznmcluUKLoWTKwNDhU71lWLX/Y
         qbqg7MWxe2Gemy7mEsBc5vA8FPxEmivQbhMnoBqvovav9bhQt1+3c7GO10DNEnGBq2lY
         2Mfhv2bdJD0SLN8Fg5dm2O6JR+SDQXxEub09KzlTOSqQggyVDCIe2XJO+KXLBrxiVUDY
         6/yg==
X-Forwarded-Encrypted: i=1; AKwUvBwZk7s6xHZ88EG4kdxpI12ZpUkOQwPrMwA240JcjIV+AGO9lgC0KaZ5/O14LVctWUyGgFbxStquD+1R7mfF@vger.kernel.org
X-Gm-Message-State: AFq9FYKD7r11LBnIE1FB5PFkTA4Rtwd0x88T++ZEFw/vtD2uAfy1TB4D
	JsGVp79dOmF3ydA3zXYXcovn9QX/4Zp+q5N46YOxBJoN/bpJY2nnuxEU7dwt5qqC9Q5o9Y13lqC
	qgXqBR9cxqb5gPl7g2+Y0ndqKp0JNGTAqbqe5own/3bAlA4+jxZRWmseRBLLGZcquftRc
X-Gm-Gg: AYBFou2QpMSiSWCdkwz+LhjyuKEgAldAlRe1G+xrMeiD0TihnfnegoEvFZsRVpj8biJ
	if8pnq/BpFsZpZpZyb/5iWmLPtIUeYAokJBFAOhZ83Th4AB7hkZi0GXbi9FMP3BSU1T4ho7HzeJ
	xUZrXQ+xyDqUd7iIfc5hWgPCuphT+/UiVhXJcXMWQ0Gwgq8TB5w+AO5giWkEftBDlUwFd26fJUn
	gCDzF1sZ1bCTNMIhIfnekhGeP8LFHOjqC0wKBhd7IN1snQAIgkkKG4Xp/d0JuvH8JRL5/n5VdMa
	YzgZm1oK9ZwI8032hTi6cfdskhxctEQnHFt0D+HPA4KO9r7xNRsX57Kshax5Ar+yHeLtbuXX0LT
	sFXlbpEr0iHvvJy8AY/zyXg==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr986295385a.2.1792659887618;
        Thu, 22 Oct 2026 02:04:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr986290685a.2.1792659887103;
        Thu, 22 Oct 2026 02:04:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e13d2sm81040666b.72.2026.10.22.02.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:04:46 -0700 (PDT)
Message-ID: <39e5f5de-c9bf-4817-b0e6-c598d421feeb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:04:43 +0200
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
Subject: Re: [PATCH v11 2/2] Revert "crypto: qce - Mark QCE as BROKEN"
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King
 <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        stable@vger.kernel.org
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
 <20261022-qce-fixes-broken-label-v11-2-0d33c34fd0c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-2-0d33c34fd0c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX1RKzffkJY/6+
 hj4OUTYs9AsRGO8yO4UtiJvVq2uXnizFbtNlADlUKJpQ/UKrx4D1EiZYFo0V4lJQn40mKKhxKyn
 N9fqvVduqdu7SPU+S9z9aVCsACn+XyXh+WJjx7HnSu+ccxvLdfZksz0gs0WP+GH++gbvm37r2Np
 TsN3LIY9xNfMY3gOKgK5EWh9hoS8Zn+aq6gM2t95xTEW1d4cL3dDoO3NDmMNGD3fgqrl7F5IZP7
 t79cj8AuX9xxN2swNpB9RV4QbzmomcxALWJpjtyF9sw8YaZN43g5hp62hpCKAOqxiVa00bC7LQA
 rU8n+3LFEyrWo1NgBE6wy7XiUupKR5Pyu+kZ+rYh5bTAviEVbdC/inp9Hi6z7LHWBt+dO5Kf9ES
 FNAtR07NrJy9aYxyW6mAUGeMca7V2CxUaZD7lUcT+E8SzqAe74fDuNZdF49xmVRdbHKv0/DIAmN
 9TBrSz02QI49x6lC+Uw==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9d1b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3IWs9GYwE_XJkEP3BLIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -VMLaNWxfQN_ETiz8e5VEavDD8RStEhl
X-Proofpoint-GUID: -VMLaNWxfQN_ETiz8e5VEavDD8RStEhl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX+9cuNoCjFAQO
 vOSC5ue3TtMv931PtYgLFm4P+1PmQe+1qwBOLrkaTB5d53alhr0jOvNV8NaqllWjEGxUo/oFZd4
 33giLpnJt7YcAz2zd9xmS5jnBjreJqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/22/26 10:58 AM, Bartosz Golaszewski wrote:
> The self-tests for this driver have been fixed. The crypto algorithms
> are only registered if the user explicitly requests it with the provided
> module parameter defaulting to false. There's no reason to further keep
> it unbuildable with the BROKEN label so revert commit df373d39c6f0
> ("crypto: qce - Mark QCE as BROKEN").
> 
> While at it: update the Kconfig description by saying this is an
> "offloader" and not an "accelerator".
> 
> Cc: stable@vger.kernel.org
> Fixes: df373d39c6f0 ("crypto: qce - Mark QCE as BROKEN")
> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
