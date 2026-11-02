Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626397;
	b=g9XxjzkvIaqjs0e5jrnA6mYEmLVnIv2DY9v7yiq14CvBcmqOeGXvN/WbJqqXGLX7k6ft
	 7v5hsk9250xmUZ7eQcUMhDubWYZLrrO/BU79v5LwZVgZ6hEpJnH+VzAIptESibSN2uI2h
	 BJWHoxAuSA1acIo3/m77nhpcO04/AFVV9zftrADWmV1dnca8Hntz7NsRX27OKQZvw0FMy
	 ujwpE0G8ezskqpyRqsvlA8ZJXbY+6lAgquuzwLXf68n7uaZrqnu/B4rA5uc1yLyi5KoKC
	 AgI52aPO1Coa9o7JkGnVemeW3ppH+ccQ5hBPVZ/35bU9ZkCTcuyBcnWM4IWvTpYrcCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=;
	b=cLi5l7wddqfn6kO0Zv+B6yg3aXuTMUlIWrnm+0VRkGEKq4yFUqB7hCCE3XNUIkT/2oki
	 jLmaYJfqtPnF4ZKZr6L8VQJmVtBrANEa5cRj9j/3ps4eACglglPQrGNKpyaGHiao1PImw
	 BOD+lwcmer5UyZkikhNA5zooUdNojhic319M68j2ce3pa3ZWKLVhwFzkLE4ujTw2EAhBy
	 satSGDOuDEI7K/64uWngMHIoAV2f1RjdFYVC4pSSsJTZZMwQ1zAFPsU9hbTuKLzdagSHl
	 tJ618k9h6NT9Vb5+3/GZp8B4USLwISHaLu+f8y5npEXOIO0hKMLaAHXzNRdqZ93LSzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJRgvgs2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e04Nl3DS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F2606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 380F2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJRgvgs2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e04Nl3DS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAebR3014653
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=; b=XJRgvgs2K7pC/6Lm
	SZ36PdLYrisZ/czYvLmC49YHwxRf3wrSKeKQUihz6zD6Y4jk4LAwWrl43n9hbmfW
	J8IlAHd4S6kt23FwWReAxVDGrPgYUZE0J8CO0Ynu3f9DC2W7a/Ofedb+oyGWTq70
	N/BRV7TK/dQ/IjNVHYNZ6TS1o2b8/MLcyCFI49j1uc3U9PyT2utnUbzjo6PeyRL7
	wx4x8WZaSLbiSltuVYTkL2Hn1P+63eMdd4J8HUUIIRIcwf6ujBrZc4PA4a8W9bup
	n4EBZnh6gQ6fHQ7mVUqrfRrdqswuYLqKVdcT25N60JmpWU1zDATE/el/LTBpARhB
	DBv5Xw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rj11d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:33:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so5901738eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626395; x=1794231195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=;
        b=e04Nl3DSbYAKPrkhaZFZF0oWYiClkp0edkG14YOd+lizqibM1IrcsNbdKfXtSARDe5
         PxVbUbnAoCR8FBe58g3qFfpOGUPcdal+XJXT/OnR5B8TzuzHmpsh0guSs95ZDZRS8ykt
         EGDwRglr6F7JIm9hmntaNExOo0AblRVkzBeO5ewRhdlw+rPOUVp5iiiB6TPojFCsDwQq
         OGbHqE+x+wl6Pd+fp03W0f1jugvO4LzterwgW8HNeH7DziWY+0ugff3Vcin7L5oZv/3p
         OxbNFj0xCkRXfHyBf3R4ltplemQrJmz7uT3tx4kE3/7mGM9AHj4pTTa3DqXGuTlQ5648
         9l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626395; x=1794231195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=;
        b=Hwmh+g5k9Xz5LOykLU9C+QUeq3cl8rq5LmHmwGlAE9Xcy7d2wIfQNvXjqzOadhvBoh
         Wbl8b3KE/0t9xANiLYlwYxUXYeKVWoCysTLnVLGy5g+8PtAV5tYiTObLw8bLM+6JVQW8
         eZxjLN6xylScfDDy6IRj0rVWuv2MscONX+pI0Phs6FzmnwceW/tzRznQ1ISTV05BmMqm
         BwUccJPNUog6Vq+NlG2M5THHw3MgOjBE20gjrDp5gRhTy/VP5h86FupY5nEc32+k0HcE
         7sGMvW+xx03RqQ6UeFttUt/CfudR3s7KdPhBEHFtIfwadHWbdOd17nYa4onWI/AW1pGz
         j41w==
X-Forwarded-Encrypted: i=1; AKwUvBwLNfZJBnl3cxkFy+E+0O2ssZ1YwCqbuMEimEUpkA00yV8APyv3/5KzVDlMDIyMNKaEGN3xJf7iRWA9mIml@vger.kernel.org
X-Gm-Message-State: AFq9FYLhmtxq/2V3SBJRzkbUL6q5geHaXprq4CQKkWWinybVsJK4qvID
	1MuTiVef7UdOcHHH/EB+WN3UesIybICoB0SIlRDShvpFyAE1B645/Iz0LVJI4OgoGm5v8RySEf6
	6EuZaLfL6Z8ixb7GsgSgvPPdcvyNglhT2FyrGBQ7I42zUqNsQupHaCfnpKU/EAarj8EDu
X-Gm-Gg: AYBFou20wfkwHMi4W3u3AdbAh1JUEsmojV3S9+UxdNkN9dv+A4abav29THJOllhilpa
	Xpz0qqlKW7DFxqugTbvH/BPCUjAQ564Wb/VWfbT5Qn6CPmxMqmX/85n1S7QSBUhB3fVoB8ErxyQ
	9rscuawGmAc3GOpDjHiey8u4Cpc1kQtXlKxKdig17+HeFDWGm4cyaSiTyoM0ZQgvlFjOFoj0VMc
	BzSzMIOgtTAR2FYzV8VlA0M71W0lHrBr1LZbqvWzR8BsKAC/WpOCXo/QGSQOoWpME2jN2PbwJKE
	aTeu1n6TvMYhUqrbOQAun4B47g0Oj4/mVKY8AY4bB/WB7d+ODIM5vh0Jr9Mn82Ys79gv7/xT419
	3DZ7J5N4shOXA3ecmVzfOcn7xxAPX8/16p3vn+ucxB8BQrCXU+J27aLhg2ota+jZtEAjby/svtU
	IDLEtdhQ==
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr20153307eec.11.1793626394637;
        Mon, 02 Nov 2026 05:33:14 -0800 (PST)
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr20153258eec.11.1793626394081;
        Mon, 02 Nov 2026 05:33:14 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36639936eec.6.2026.11.02.05.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:33:13 -0800 (PST)
Message-ID: <cc56469f-8f9a-4f89-85a9-d6f396ccd3c2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:03:07 +0530
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
Subject: Re: [PATCH 2/3] media: iris: Disable the system error work on removal
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
 <20261017-iris-handle-unbind-v1-2-7809148eb90f@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261017-iris-handle-unbind-v1-2-7809148eb90f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -tsvVB2QDQFAox8DfEWZIt7XZY9B-Tp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX4utk8dwq0EQH
 EGxPD61jU8MK1FTvPV9TjdH8NIQLLEkqL2kqdRLLsPcZNasN08lVRKVNsSdBNCYcxOROuigpvwu
 DWdrvhoTrTgL8Au/0W7+8kl3wsyBnyOPubeOS/MlPyzW+tSJfG4NpGNubdN++vVz9JV5h+YHB0I
 Nfzt7+qFXXwPjmRYHwEcFGjFCl08wiZdPraWUtdwYMGkuCFQ1luXjcHnPFQNoCukK4p+7A/75gN
 FmpLJJYtlzQENOQ9/Qz5MZ3X6dKcr/k3KLhqaGZumfCirmw/lSa2PB6MWf3xkKdTv1SJXoNCjBi
 OTXbW1QV807CE8Dw/jFq0G/5Wm2AvT1UIlGhQi0Z7FQNPR6elFmg/mmPB79oSMr2FOAqVp6ZvJW
 QQLhrTXOK31zCNyi1/wnQJ0qcQX8Gmze5x/uhOzb56Y7wxspZAyxao3LJW35J6wi191CGZowT0A
 RxJT4tIlSGZZg17f+hg==
X-Proofpoint-GUID: -tsvVB2QDQFAox8DfEWZIt7XZY9B-Tp1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX50ia/5YbDhhu
 Q+oLOV3nrZRzpVbWuzN/WdgxiVspUZ9lYQ5gQsWsXV+B7rLjSIiNXjoJbXj7l5HTA5J2j+wNkOG
 8Y5X8u7D6Sxwoy6hkefNQjUqoOA6sOA=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8911b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OnH3Zg2X3O9LORF0kDoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053



On 10/17/2026 8:46 AM, Vishnu Reddy wrote:
> iris_remove() calls cancel_delayed_work_sync() to stop the system error
> work. This cancels a pending work and waits for a running one. It does
> not stop the work from being queued again afterwards.
> 
> A system error interrupt can still arrive after that call. The
> interrupt handler queues the work again. The work then runs after the
> removal and uses resources that are already freed.
> 
> Use disable_delayed_work_sync() instead. Once it returns no new work
> can be queued. The work cannot run again during or after the removal.
> 
> Fixes: 452480931648 ("media: iris: cancel sys error work on driver removal")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
