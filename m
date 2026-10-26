Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010207;
	b=4Z/I5w88NnEQAfNWSjmEvzW6ynUBM/ftDTcFRCMkU0vPNor9Svq5qYZ44/RMCBL9JJHZ
	 ZmgOzNH934jmj/Z2+0rfqIyzdneEnURs6bkFOT8OmEc3Y3zp8+ONRSDSatPdJN0+SLURo
	 D3/BLSRchSJPop2BxTrkcHmI4pw4zwPty2ecphjRlHFW/+wUgNZWtV5jDvjEivlux2uMU
	 PdWclODQfDlWyblnUA5RSI8LYKMP4dIKDuZUFRUWpuLgUyAZPGNrzlEN092Dcb0Fsi5pk
	 znUnet5Wemx04optTxV/+1hk1kNlaxkF5Rl6AN3IC2w0vjeL+/l1MpBjeM1IEdWtBIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GsDZSvb/ziwVv/+kCRkHifsd/bmXIrJplkWD5AtBipA=;
	b=p7GKCc/7ITbQQhVxKRP6dKs7h3iAM8ERM6AYZf5aMrOqrzuKzjHlLNEwkW6c83hxCOWk
	 WcHp5fkHa31B4OqAbMxMMV3K1rlDtGZlePL9sbnmzgGLSdNjBkO6BlU/VQp7oIUc9k2vK
	 o1+0xqpPR6C3AX2noj/g9QahZc4yRm8g/IFfmhgWnilqkCv+JeLIYzE5/1vt0Pzgbf4Jv
	 dFCt8qCwrtrLMKtoJrO3xI4enFRViV/T8LdU/hP3sILebcRE19+BpBjRASXYs4DtBfE9K
	 +9Xkq2XhB245qAZ4t0Tda3FmtjVooF1/JcrrKW0pdnOotZFEUP0L4vhb7Iu9zPtxcYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VLhNGqJi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q4p/uIeI";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A976606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A976606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VLhNGqJi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q4p/uIeI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b7hm3302358
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsDZSvb/ziwVv/+kCRkHifsd/bmXIrJplkWD5AtBipA=; b=VLhNGqJiB2hH0sFx
	e0cz73xlzSoHeP/ooJsF18kH0BAwW54LJBHJjip7cpNvxTCA2PrZU54P3I/q0rqR
	sLVN26WH0njsjljagUB5EezohQufzn8IF0dQRkCqeMRGQZGpJuGpVzJa+Z4uYYO9
	kFzbIXpq3zLwgzMY7ZzhEmah9TLEslI6SOfIMQPXkWK9OxWNymEJ+S/x0ijU1Y79
	ZSLvnXaTal1S0fzav3XYz2Hf1DrA32ZiXtAes5RrhHye5d0ONRO0fP+pYocoxS5p
	c0rPtODw0cnJXFnOPeWX6m52OFfsGqQzwgcKiG/JDJOlx7KBgRk6IyTUlQXS8sbC
	AiI6Uw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpsxcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:23:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dfb24dfedfso31254245ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010206; x=1793615006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsDZSvb/ziwVv/+kCRkHifsd/bmXIrJplkWD5AtBipA=;
        b=Q4p/uIeIY2A+i413NxhtZ6Vj7ILv+Ww7Uw9xBlhXGCG3UCppv4lPH2GDfi8M1q4iOt
         m8oqFWLzxulCLc7q9wmXQVR1v0fxcMBUhNjg0W/cwnLbZ5M0i5CYI3pb86yJ1y1GS263
         yvP9oL8q/042G2TWbUF2fLcYnT8Q0UDozpf1cX7G6lq5cNm0CKle0LCNdwAP9Lm+wfEU
         R+xfaydmneytURmrl+p9zwPE9p3jJg9LTfKrCcVEg2txfu9VhoSf4xkt3qyy9+Ycer9m
         FPwUvUsrdIz0OG6NLCpZZ8gXOtVEZcX1rJokPHar4GKoTRkX93VI3AyPC4dOmd9xAkoz
         Bebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010206; x=1793615006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsDZSvb/ziwVv/+kCRkHifsd/bmXIrJplkWD5AtBipA=;
        b=nOjxwV3e4vqm+5Ar8Qsr4gl5p3nxsN9SY0dmpx4xiny7FD8uhS+gphvqKydPrC2vgq
         TZiMOEfYZxR6pSi+bgJWxJKBPM0+IXaoLBW0ihgRtUSEFeL/dYtLolOqLc3u+zuCmHs9
         naH2wsCaV6w/marIsBbljBfgQw78YaKwnvIkL5SuBKruEqb3x9ZPcU006ZwbjCrLw6mt
         kOhRiqr4a96V3k+sMXyNj/TOalyJeTL8AEoNaJHjSqPC77C3cATQQcurXf05Qcjrq2mY
         /Q5hwMvOr1gNxQjy9oD34A0yve58Sqz587QgizeaLEyz/HH1lMCsJzyBXG7ZW2gj3Nm9
         kueA==
X-Forwarded-Encrypted: i=1; AKwUvBzkI/5CVKkLZyD+48SNMuZJqP/R63gucJDrHMZwksvNASaPla4ycpJKdezLiwRQg61TKXF27so0gAYaOjz9@vger.kernel.org
X-Gm-Message-State: AFq9FYLDmCNDfB+ZFXhms+AQQQBE71s0JZ515PDD0YDmPhihLHZqy87w
	4Kawd6jOYyzZzKhQJKolVJg/+pzqyfOYqD2LAcZpdMOxcCulwNsiTHZPadOFdbccbKuDpWajbIH
	zDLzzn7Agd9CAASEx5/W2ktT1kUPMbCCubyt4efHo6B6R6vj4QiHGKIY8sxUV7TAZA0mc
X-Gm-Gg: AYBFou0YAr+WCaJCpFANjSHW4NB+U0rYjWJzp/3yaTOBOVUysKuGH3MXSrMcKJkvXNI
	Px+frMkomoE9NTDdf2r7zLNJr839N50Goqg88gfMiinHDJYnZPZiXZjN2QDqdeW0SDhFsfoqlXX
	Ll47falenSdQvQA8rV43RtVXGzRbqKvB1O9KqCAETha+WjRiNVX2Zv9pMTP7c4DqUDDFm5eXZgq
	IBwCT3f9XytPQIhffbi0vtiA8QqSMgMMcGcHxqxG99mqIXc6otI4dhFEcqKPWIfUHeSkjWde5vA
	4BbXJgFIwtJB3P3QAhTQ1p9deHWjpnY9eJlelSzxROlWaKIinkM0VZC370sU/ucFBFkuKZLCZ5N
	LimS97cC7wLY8mxZPaqG/R/rX0f0l7gLV7Wq9SJmN0loFxNa+8vsgPC8CGjPsfbki//cAD7lx
X-Received: by 2002:a17:903:b85:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2ea9c953f2fmr51636735ad.59.1793010205680;
        Mon, 26 Oct 2026 03:23:25 -0700 (PDT)
X-Received: by 2002:a17:903:b85:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2ea9c953f2fmr51636575ad.59.1793010205256;
        Mon, 26 Oct 2026 03:23:25 -0700 (PDT)
Received: from [10.133.33.203] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af32271sm14575335ad.9.2026.10.26.03.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:23:24 -0700 (PDT)
Message-ID: <9f76467c-5b21-40a2-95b8-e91cf1e1b47c@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:23:18 +0800
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
Subject: Re: [PATCH net-next 3/3] net: qrtr: implement shutdown()
To: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sashiko@kernel.org
Cc: mani@kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, horms@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        tao.zhang1@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        jeff.johnson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
References: <20261016-qrtr-add-shutdown-v1-3-e1cc01ca5919@oss.qualcomm.com>
 <179248895481.3135.9231497728918795508@kernel.org>
 <20261021133531.55da7de5@kernel.org>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <20261021133531.55da7de5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX5UHtMfODBQbl
 B88GpbpJB5xGROo2FK7hK/rcsheAtmlADrfaiUZ1tvULx5E0TIVHDrLuHlZF3OlrsQ1xcLPZo+X
 tZoZ/ZkB3tYtC4f3VC6fnFU/7svwyD4=
X-Proofpoint-GUID: XdcYUpVaf9FzgN05b04600PLXHZIgtV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX5rMdevXUeFnD
 Lm2NND486oVt7juuESybadPrAIoqFB9Rpo+IOkAf7AaRnbu3O9jtdRipyU4+XAROZDyGANr0ds4
 JRK9d+JFStvVmAOgqfOEqJkvt8ZHqncnQnkfWvHy9tsCHFWYGkWNqXuakL9JltCfA4A4XQq4cuk
 +siWcVqGetwfLUJRIvrrSs/nAYlBM9zmsWCi18wc9OSfGXsOpqgyhQlaxnSiJj94Rf1ykhc85kb
 OgnYok9PoyNHgidi7nw0jlp92gnq7uaK6g5m37xmAD0F5W+e/mampasQR+k+HWDL+I5BY1bQoGx
 rOeUtOyl6HwxQP8xTrloCPItT9m1TEEgxM2LSyKbDAWI9oAeG8vlibMwdSmPII2gS08yTgcNiNI
 mNIWNzENimaFwrgtGY82XEWzcllewSoTgxJlM5UimaYLuuGflX11OoANmUUXNVcZLbdEgdsMagt
 nfCIEspDcMku6yKIL5A==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf2a1e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=goVogqWYekQxIWN7P9wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XdcYUpVaf9FzgN05b04600PLXHZIgtV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

Yeah, this is a known limitation and the commit message calls it out.

The sender sleeps on flow->resume_tx, which hangs off the node and is
keyed by destination node/port, so the socket has no way to reach it.
Fixing that means either recording the flow in qrtr_sock (and dealing
with the flow being freed together with the node) or reworking
qrtr_tx_wait() to also wait on sk_sleep(). Both touch flow control
rather than shutdown, so I'd prefer to do that as a separate patch.

Without this series, a sender stuck in qrtr_tx_wait() already blocks
close(), ioctl() and the rest of the lock_sock() callers, and there is
no way at all to get it out short of a signal or the remote returning
credit. This series does not change that path; it only makes shutdown()
useful for the recv and poll side.


On 10/22/2026 4:35 AM, Jakub Kicinski wrote:
> On Tue, 20 Oct 2026 09:35:54 +0000 netdev-bot+sashiko@kernel.org wrote:
>> - [Medium] net/qrtr: shutdown() API violation leaves sendmsg() threads
>>   hung
> looks legit
