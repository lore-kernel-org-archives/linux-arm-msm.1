Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795817060;
	b=yhwZBFT7QFyE8iZaPlN7ovuOmwow+mc4Q66+uRkP362yHqcyn+5l3MuBBQ6Ac2Ov1vlu
	 opXpkk9r4C8/3sxVfCk3Ew8a5p/3K3zHs9DWgET71O57y/DBD7ro4ifKUqx2C9LlLb3aY
	 nNod5v5mxJ8W87LgrpLifmYnBSDafhy0g6by1awr85I+/uXuqRiImiOJT4QUSZ0AbE7wq
	 vvEZxgq2Jqc3Rh+sCeJJMBTYProw5xsE8RkheQdmyrvfFWT+oQDkZ+NRQ0q5X4/cgV6A7
	 w7lRIfnAM8QicyyD0HC4XxuBpYh1XB/+u86vW0tH2sXsU4IfL3/RdufcLx4QCB9kIqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
	b=Ps7HMNjDGTE0jyiyns2x6eIpcfRRKP1do7JkWW7gBzGaAKVWDVAPZIbx1VcYgP3k6txL
	 xvZAjBM/OJ2EomiykTAqqT36IUftcctZ6ZXNQ3ZaC7f+PaGMI2wPEIGOEMdlfmMsdFrvR
	 jePm/vAsudfoqnKsYoCCwt7OsB7Dnp4ZkHFucDhQEz+HkCEQA6CMUA9hLplGPSLcUPJtW
	 xeZ3Fld20weKMsNfXHAVijrOo3joHILfhb26czRaTAF6jnoH65oAKqLyBBjMZP2IypTkB
	 0WffX+p+t4ci3MjrgKMMwopshWojVTF3Iq2JN7CoPyu7ZTgOdlFPispp47MgppWALWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuV5uhcl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eXwLlq4P;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFCB606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 22:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DFCB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuV5uhcl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eXwLlq4P
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARKsASX3349985
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 22:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=; b=Vu
	V5uhclGLJCw0uuDKiYF9CAaZtWBrhjmkkK5vqeYo4SiQvna1e7VqqrIsW3j2OiS9
	0/mzPioQGVmi+zv538EbWc0GY92sAslAei8nYZ0pwFIcL1BUQW+tHa2o8fQ9v48y
	9hTlRQlYhqIq3gvlaomL0BPc+7CfUlVXyQGTSiEzifDRX4aOAomRg0aMGI934hg2
	jjfgoKBjYyXAjYRqilnyAUCHA3mZnSy0rLXW/Kr/cGozYEcZoNGXGywinJ/wwBub
	yMcVjuGvijFy/92EnyjECH5/xlx9k36H2H1a0sysBHaX1wM1HfHaxgbi2KxQkdIH
	c9uQup0+e3QZr/MrFJrg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7hab83xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 22:04:18 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-458326d2d9aso5257460fac.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817058; cv=none;
        d=google.com; s=arc-20260327;
        b=e7TdO19nGbGGDtqETTn3bYCctGdH+6z82ivPqQ9w6ntHdrXcKzUljPAMBxYs7otuaR
         bDEAPtprmc5cv983WOxWEr7mXnsQ4uO0wKyhv8L2yLqrOALghkawOiYjJvPFrfrU8Gwb
         b5FL6/yeX1dw14KSOhpAC5vJta0gmzC/OqalnMGF1DVyRaem1JH+ZfZ9TDkIQeTnAibD
         KTFW4PHmwpjF1IIR/llQBl75MrWP6Dau1go5p8S+JBhq9KJ7ryjpaiQc3N4wzqGbdYZj
         J24xYh4SXG2YOKZRjgBIKb83/1BAW7fghPtf9Ci5OJjrTVrkbZnx02yKLUKp4X4KsFSa
         ckgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
        fh=hSmrqpFJnw13pPlYXNZkcPKqZeIUZzuuCUha2xYXoXE=;
        b=GX1uHsiM03pX5SGFIxK/n20m/o4t+nguwJUKZGkdkNA+zsWyuxhUPtmUXdZKPSSm0H
         OCQTxd9vV9tW24hDU1HlsTbxRI128jVj+/7k4UNGDcXMb9xIan5gkFBWWlt5Tf0F1glQ
         84tnqmBBL+f6P/jZ5P7BKvxM0D9WqxyCFILMbsvzoCtvEUJX+G3J9P+OJZJVxzYwgj2p
         nOFIPjrDl1zAz92XhMjfp2/aJ671pN//BvEZd4Dh8EjpUMBENO/JStCXUYeThQIaFYb5
         HBwSSoKwt6GtfOVOjPxeF0TUH5ue/QS0sj0T9vDd1fLHSiQYskZayIrp7EWamSAvEY5M
         /XsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795817058; x=1796421858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
        b=eXwLlq4PYSgOHHx6/XpsQMNWT0E0nHzeVhbkOkjAmhom8njmHs5xWEfoylrxg6UyvV
         eOx1dxC85FK6zF8BKmmkS/K4W6KEwMcQpy6Rh/iTci3lBdodguOZ0Bp+bAOXEQ6hi5GS
         6C8IoEwABtGvlCpv3L8e25lHaK9aXiYueNT/s1eIlB7j9YfQaVWgQ51wyDnEzAX3UlFG
         KJfyIzoH2Z9IsgQW3yT94rTtSGEQJZLZa5nHCJTL4dy0SkvzBhEYYIbvDPRCbj/BktRd
         +u2yoKt57YSTzpaGbDs+3ZYOCk8J7S2O8JwQg8CvO7LK+zqEGnYTAZa9ZYHJ1bXIT+QS
         8fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817058; x=1796421858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
        b=Ae3f0LkHyUx9uIekbbvAyg6oO8Xi0flup/w5CEo7+4cUYvRxYa3d5q0iZ0pLAOYbdM
         pEKdD0qdUmJf7DlxvuciD+TGIKPQXZS7P+zfqKUysDu+fgoesrwaGSi/d5/mLOEke+ZU
         M/tYi/yonxzOKknys+5/GbC1kyDAMpEXIati2PGg5/ppOHFA0LxRINvC0ZFx1Marrjw9
         /Bbq5qb1zsYXyJt8ndgmNOzdTqJ4KAkiI8OsQiLTAOnWzUz8pRS09T/ncqTy4nvD+3ud
         e+3ithupvI/eaD1i/mJ7qww9T5tvzvO7V4Ac0L0TobeabjfRS3a67u3h1lPB2zwYz6nb
         afrQ==
X-Forwarded-Encrypted: i=1; AL+hErH5TT9mbw/QofsQJtYH+OpD/g6CpT5o+45RG/xopQCd0ticLnq7P8qe0sP94yuWN7Tn3yK2V1AIZH11JzKj@vger.kernel.org
X-Gm-Message-State: APuU4Z8tCPGdewT4kAUQfQNJgfedbWjgEICwLVvL++hQeVsvgzdVoGfI
	rDzSUDeOm7Impkdz0033r0n80CZNrt02Lon08kau/qouaVSheMa7W4LA3l8YGDVI9yXXOQVTO5E
	YgHZX3LihZnAd4hFHJmK0q61ZJdOzooIl0kgA0S24cIzvKH9+jv/3DObDLFbNHiNxLQo8AK9eky
	klmpLLR7A2DKVbEl/LITX9i0bB7Z77hp0nsMcVrWpqkYM=
X-Gm-Gg: AZFdTZf8FAOoe65M9diT9mKYccAD8Xwi7zCedyqSMgmmFe2SiyubSAmHvRe6LckgqxF
	146094Ra5B48dWd1XAnNGbHW5gZM1hMQmgcn3UOubxbzPg+dnWEba5CDfQ6CiSIKjGAos5tkjRu
	nJEJKFF6rvOXdRIiHovxxsFs1t77xnBzSm6x4lNwz+DVUjUfgVcebvQEPYpQcAsi3LJLtnS+/vN
	hOaOETzOdkWJ6wl9mjbPQ==
X-Received: by 2002:a05:6870:92c9:b0:491:6c73:817e with SMTP id 586e51a60fabf-4bc7d270fb2mr24823473fac.5.1795817057574;
        Fri, 27 Nov 2026 14:04:17 -0800 (PST)
X-Received: by 2002:a05:6870:92c9:b0:491:6c73:817e with SMTP id
 586e51a60fabf-4bc7d270fb2mr24823451fac.5.1795817057156; Fri, 27 Nov 2026
 14:04:17 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127-qce-fix-self-tests-v13-1-80b601792901@oss.qualcomm.com> <648c686f-c20a-418d-9314-4b269321406a@gmail.com>
In-Reply-To: <648c686f-c20a-418d-9314-4b269321406a@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:04:05 -0800
X-Gm-Features: Aa3M54roYu8MrDi1iygKtDP3qZ6YDP-WhV4C28xi4aVFCCESr3FORy1xpwMQ3ZM
Message-ID: <CACSVV00Juw154J08msOA63a-_4TYvHzYqsjPnD_nE6jg-_=GZw@mail.gmail.com>
Subject: Re: [PATCH v13] crypto: qce - split the crypto driver into core and
 crypto parts
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=fs9J914f c=1 sm=1 tr=0 ts=6b09fe62 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=wJmJrFKEA18kwO9BSagA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4NyBTYWx0ZWRfXwKpxBqpG+aRB
 xX9frdEsraXRZxyCTvyy48bhhC3DcfGC65H+uSBk1z9dnlmBcSojpgyRW0IJsfUuHQnGbVqC+iP
 VNIUFxf+gSQjTYpgOwmXGDbcOsI4KcY=
X-Proofpoint-GUID: zxkOvop1JEhjbOEf0eTl1UBOlhlSXb7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4NyBTYWx0ZWRfX5uY7r/8bktl7
 r3SeZikmR5Udtr97eAkdJW3HcyWJpMz9NN7XqYtTtlnlYcuPs0vEBO+BKZsUh6iB3wUP3NuLTyO
 JxI5EoWI+3w0JmFHkOVr4VWs1x5qIqqh+D41XHCibLcpIxjmZTnMzItpqyN2s6DoaAyd0DTZ/30
 HjABC+8QwkaiRwCYnCJh1n2akEzA9eyyRFXk2M/5chIn3ENs1/nYTV7p+73TnuVpe8+gA72kyBh
 rZW8/tBHuWQyOjeTb8I9P/7wyiciFpOAzEl1P/uMgVoSsd5wKNhhmlWJAo32oRNwG446GaBIgRS
 jadi1xTLl/7TaBYlImHJvbLlT8G8pSvYpoPtgkS07XS3FxQSJOIl5K0QHTJxX2pKxF7h4yhoMAe
 91qqxUJIGnQ5DM4GbHw7JSGGS7yo5l9rrrlXYBbkSkOFsvzLQwfSmdAkfSVTtt+L6MOBzOIapEU
 ISwyOvgLEVgfrilvhlA==
X-Proofpoint-ORIG-GUID: zxkOvop1JEhjbOEf0eTl1UBOlhlSXb7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270087

On Fri, Nov 27, 2026 at 1:35=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> On 11/27/26 12:38 PM, Bartosz Golaszewski wrote:
> > Most users don't want to enable the crypto features of the Qualcomm
> > Crypto Engine driver. However, they still want it to scale down the
> > interconnect votes to 0 when unused. Additionally, more features for
> > this IP will be supported in the future (for instance: for secure media
> > playback use-cases) but this functionality will most likely require a
> > new in-kernel API.
>
> Nit: Can we use "restricted" instead of "secure"?  From the user's
> perspective, the media isn't any more secure than any other.  It's just
> inaccessible as cleartext.

Very much my own $0.02 here, but for better or worse "secure playback"
is what the feature is more widely known as.  I haven't heard anyone
ever refer to the feature as "restricted playback".  Not trying to
argue about the original name, just pointing out that I think
referring to it as "restricted media playback" is more confusing, not
less.

BR,
-R

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
