Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628815;
	b=cIgpXv2gxRz1MYkLnPlqMS+0S5ZjDEPpB8Xhyvf/CXgz/1h+gOIZ2Jvhue2HDUBEWJHP
	 2tuUMqOLinl3ievD3sdW1aSND1pZvDM7tLi5HSHfeAwpEzdj/fZMwTDBpwwwnwGHVAlah
	 V7zEM5Ewx3FsC7xz1mX1SsTCe0LpzNI6GB+TdruQvkQK9c838Ld/zMRPr3Ug+bKtfACMb
	 YlAHDOSeYF+XrFiE4FNwFNZ3tHonwkwQkxxp0p5TkUXdPLub3Y6bTaCxRezHuprr6D3VW
	 cbYBreQ8JU+fQpjDY9xfSgY9/WO7uKEu0K7aEK3jDdSni/pT/DtMMt7SEnTtUxBpxyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=;
	b=3b48VD4FcliTiDBNL/ZCO1GCbLm2WDWXtPu+NAMbVyh0izA5bDrELgcvpNOMe1cjGAy4
	 6Bg1ffXU9lMNVpdhf2aJMtXtpOqHMkJXxVS3wGI0vHrQzLVdWwnSv30NCi/JOUsM4EShS
	 cfbNoJLvNwncOZn6YkxyZFOR6AW11NTKXPpHwPKU8412dFyLnd0+5N/ZWaau/5OVJqNki
	 8fNUsB83Opk4ZUBEeBFTxczb/emQ443HEV9qhtHuXSLa7p/TD9+G5KIe3vSyy7J9bO20f
	 6pDmXn4vNOMB/L2FY/vwkIZd6S1viJgsVSUbikc81rMzWn0DYWbJhwx+dY1wMKfOcqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSPfiE6x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQ6JP0Q3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E9460A2601
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E9460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSPfiE6x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQ6JP0Q3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpUEZ846225
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=; b=NSPfiE6xDo/8ghGT
	6+PlD3PTv13crzBoIbAabwHN+sUM171Dsg0nNyn5WVfwt+FAcdD+TS8V3OFfYkJy
	eGBnFGmi6oe9vBGlWyuViw6kKM01FxVeB2sIY9rorxieaw4+yp0VENa3lh2NwTaz
	G8XE8qn2L/GfIw4rHpKDcikxHKxInEy9f7AHaUWnZ3fDGoivVY8/6d0qiR2OxX84
	5IEApv/Lqb+eZ6LJ452H4S0yDCKz+1BevqEP4qb8C5+JXZaF/GdHCCxlUiKy2Z8x
	mlyczYI61o5nzjLuwHbCL9qH4BGbBKRford8bYycfHwO+F9DDvbkV2erlr7kSLzL
	QaMCdA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1syex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:13:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so7253275eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628813; x=1794233613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=;
        b=jQ6JP0Q3AT5LTg5mjngOu4+nnonZ3bu+jiRFUZQNCOEvz/ks4ba7E/UXm0DYj1kulD
         r7LNHjhw2ooyZ7BGtkna4LJoDjdcIrK6aHFhmkYL1i8sHPETl7hO6MtR/uxrpf4Gl0TX
         vs/ky0VmOWXCh17/lAjZMfZH4vPujucXhi28q2bip6hsF2FZ7kSGu8hijwTUZQ0n6n9X
         eGrcIWzmw+AS+flkmzyaiQgX4GBg+i8qzNPd3Yzm76hNVb/xyVYW1tW4HiMsW7Q+scYi
         N2YDeRdJMG++e4VdhqGKF1k+D1/NLKKelvfIO/U796ZOsw+ay3kbhmH8p93vVtSRDGNv
         FEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628813; x=1794233613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=;
        b=pjAUOcdZyOm5OgjhTBC4oz78uUFlZwOhwHvhuEs1zrPX+lZS+1mZVHeXqPV6KJ/Fvt
         Y1en1WJ4Ji3ZEPAyovWOrYzKyV4zYpJT6vum7RieQbrNJ7UpqLTEVRo2mb+jPi4Y0221
         KQPKUBuqYa0aTf/LiGT11GE2YnHE8mx7nZNjTb74BVQYlI9E+XTArSYqwqCHI1F3IrRb
         3TQZ6vK+oMp+MKyNLnlrVv+ZPaEs8iA2/gx+EkC8YiHstFqLjtkz3wLXD9Bnkns8YDBZ
         jMphFKYBkfPrpQ4HMDdwuIndHyLqWpwtzqGtNAqOYYG22DnZdEtGjZ8OTLZUn5EaczTB
         lJ6A==
X-Forwarded-Encrypted: i=1; AKwUvBydvEoCg4IusQ/XrWgSI4eyjLt/mdFcl/C3D41rplf7Y3otqQujMcOOB/RGzk8ajTefor76rSn4lFaHKFB/@vger.kernel.org
X-Gm-Message-State: APuU4Z+viZe4f7bU9tbA21hIPegXtcwtQav5yqp8pSeJk/vr+sROWCIt
	wxddbxlNHJR72EC8X7NuNdaYxo9icwIuwlz9idtkz1tURJT7BDoIdeTgyR6OWvvfYQKFfC/hIwL
	6/6ZuFTwGaX9CFmE99VXD6TELVUK9uYIumGRLcV6jcxm5KZnw6vK31z4CXjgWn1N3Hnat
X-Gm-Gg: AYBFou3ttoa3RnbxC4OKGOOjM9FsDBj/F1mkSVwFQZwvYZfsnwY1jf3Ntw0bWyplivs
	riL0JK0s1ZZoHfboU2z50ox2G0PUpGhKEHvKzRWObDjkKvixf7rcrmMQk8kKB8A06Bf5sUfbDlO
	mqGRxltAZ4NUePJ5eF8YDSxnFxnGTDAjOWuIXi9SHfzzlzcospARHkJQqQrHYtzwl03Tnc7ViBO
	np+Z0AeRr72/ydxVbFWPcbbN4n0fNj6z0EGhtwlRzb7iCWZzEcPGlum3eH3EHHHVA1Dy06bXf5K
	DU04S5uEsnEUwBqqrB85LC66cADxMLwtR3vamf+F/Nrj/mSq9EkWO67mII3QMho/eGXSIKaBMo0
	46FVV4P9rGTagG2uv20abwX+jgt44QvzF6YqYuqPsZZSuoHdzRI0sNNyUvCzGaZGbIGh6O2pCgT
	SPbGVsdA==
X-Received: by 2002:a05:693c:2802:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a4220407bmr14614533eec.5.1793628813261;
        Mon, 02 Nov 2026 06:13:33 -0800 (PST)
X-Received: by 2002:a05:693c:2802:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a4220407bmr14614496eec.5.1793628812636;
        Mon, 02 Nov 2026 06:13:32 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm44416221eec.22.2026.11.02.06.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:13:32 -0800 (PST)
Message-ID: <97033b9f-8fb2-4571-847e-7ccab661b93b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:43:27 +0530
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
Subject: Re: [PATCH] media: iris: fix ltr count rc_type validity check in gen2
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261029-gen2_ltr_fix-v1-1-6d5518d59b9c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261029-gen2_ltr_fix-v1-1-6d5518d59b9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dh-EuXQ7EpcCWIOyABTPexOMryGA8KGu
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae89a8e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PxXcNx1syzcY5Y30yX8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfXzKdhcy3Kqbbf
 fMP8Q6jd6dLoSR73xKwGcKe5HtTrXaaYfscwvXVDvtdzQl3fcAk05Gs81g3SSWcjsESdQPmpZZB
 /d5veg3TfF+fzUqPXLc7KeN+hDk/PNYfn7zUVekKuO815fMX4fVmPCN4AM59locn8hWXK/6b4N4
 946vmQZhzzlS0K6kvfFu/4OGiRnLhvn+jEKwwJ2GyqRWgeBhSxpLW4dd9oJ/oddTatK1lI0uO7l
 EZRVAMPfsSrbUIu20jx8zo17rOrsntW7agmRFugDpwgdf/QQr1vphzhJNgJhlTjnOtyt/rCz1/h
 lColiYmPh3SV1a3bIrfYdO8cn4bh/aEya6SlNcjGuxLThgxeuUPTNWJ+QR4m5vFdJ7kZNsfsbXT
 t+1WZ6UdHjy6c6orXENBqEqVT2fOW3G+pIVXa0TS5d39jsHOhkvGjhbxl8iIXw2f7CacwT7IXz2
 HKazeMkTrghlHi1HkVw==
X-Proofpoint-GUID: Dh-EuXQ7EpcCWIOyABTPexOMryGA8KGu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfXxabOyEQO+oJm
 9lmUVGudvSQEpmD5FLYW+ZAkShWNyUFNkFbavBgC04ELArYwOGoUzrxeeIKVA1F4UDjcbEwnt+y
 NJSeOLJGToBV4NxBZo340qRwj6vXOls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020056



On 10/29/2026 8:42 AM, Wangao Wang wrote:
> The condition was inverted: CBR_VFR, CBR_CFR and RC_OFF are the valid
> rc_types for LTR, so reject anything that does NOT match these types.
> 
> Fixes: 6870381285b8 ("media: qcom: iris: Add Long-Term Reference support for encoder")
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
