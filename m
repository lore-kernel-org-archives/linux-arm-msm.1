Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261293;
	b=JcdlIl2xIcrUq6NaEUECLGCam100yiZQiLlI2E9JFGerUKHyTW5PPh7SGgIzvXcXEMOu
	 mVo4KP9BAq9IEtoV+q8XqeF937qJNzJgR4Zpf6bKW9kSfSem27ZhhpJdW5UPQ0gcDvcoo
	 OCGEwNbmBtDZZXRCyqLhwepweaRotBjnlZTOo5WTXMOzkShdObBkAY2JeyrJyA6QJmF8E
	 EXNsYatAzPHNabM5hKSYX60h3SAxER3oiZPg+vNzZ/ENlXiBXC/f05EgkKV5rREOLu/YX
	 LuZsarq5JdJ7Uwoj4bVrie7pDSeJ3Nq9/kZGNyPMmZkJ8TbW4StJncS2BY9hD5G53qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2dGnBacEascwLV7PlpDA1yoO3iuD70WS8ruoY1ymrZk=;
	b=jaIGgs9Z+WDJ6lf6gFDEeNHYffxdqhpEcBSCRhLzFCJLCOmYxnt7mOjxt3wT2T+FPRch
	 ZaA1VDQuQzXdJoOf2zxMVtG8c6LPp8vJQPdwtBWBoCTIu29+d880MdZ088qvrH6iR0DCc
	 5nYEKRnAnz7xcrXDtE+FFp5bX6Zz5X1IbVMaCBxy8dcsD0OKvH/JMJbt8P07Ca65Mmo6u
	 NJ4alAWYztSU05Srm1ytfaj/b0bgX8HV1s1i3qb2zZNpBG1qR9QYqx9hnv1LJHYJ+EXx+
	 B821tjLx0R3MZo/tPUJ/FZQSZxIZirgoT713s4YiRpj77QTZGTzeNxLKul05DFM8e+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGzoY2lz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SiuOJP1F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BC7606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6BC7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aGzoY2lz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SiuOJP1F
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HFG92428256
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dGnBacEascwLV7PlpDA1yoO3iuD70WS8ruoY1ymrZk=; b=aGzoY2lzhLKgvZDS
	wavnmCCaDeVdjFZRdROWQEq+yZyCqjXxo6IqpJHRcBg0fVDIejsA2VXy3BUUc1Ov
	WEuxBpMNsbfnyns34QVDvSFWcakINl2K18rPbPsFHqtOZF9m8xa2Nuf92IeeN08h
	LQld35e5J98OjSkUMblxn2NC2OTepzx17ODRt71p2IdBgj67buaWqbARLY1RUcZg
	LNc75is+7ooCV/pTuo/6YNkY245hxPXq14FiAspIkPMNUIPLE6kKn/shHqbx1O4k
	nFRDvZiDFkk01RinKZ8meXFI+NH2vNMESwzCQPBGn4yIHS5OD5GaOiPKxYtNhO6n
	1l2zDg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2ayc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:08:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e942b1cc86so18270985ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261286; x=1793866086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dGnBacEascwLV7PlpDA1yoO3iuD70WS8ruoY1ymrZk=;
        b=SiuOJP1F8c194OafCX524DizHsokakQu1GnG3B8AwOnjYGyjGKzjinJDcyUWG7Ex0O
         laDevBnRgA88Yr86hjgB4LKhTeOloQ3NyfoPHcHp4Sk1zWteG16M9udLhKAlBOdzp51h
         5uYoJ7g8z25RynJe7DHgFYfWj+Fiogoxxe97OeQHpTaeQGGvmop5yv4X7J3Z2dzmTgwv
         9lPHzJiiY7EyHEmde1plV6bViKAAXJcSKfMKvOo2NJTuCotmTMSJmKrGvsdNq+Z0HO52
         kzQ7TyvxOL1txHzMynd6EsYmZBAvLhSrQIctBmPZjsfOJewGLZm1uO21rgmTMealKvbq
         WsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261286; x=1793866086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dGnBacEascwLV7PlpDA1yoO3iuD70WS8ruoY1ymrZk=;
        b=P9kWMggSr42uFGoQ4pV625QI6wWj3OkXsGuiN+UEBowAIBmkbGcCGCohiYv40HsSZi
         RJFpm/8unBKZrw0I6ekfpxVj092jibjMgOEW0RfYC7zD2c4GDR/uWCy9aVsIlRmNRRfP
         HIElhQ6ymBXcz9JQn2SBtg2UnqeQhcd7P9W6lVNg7baLwNot7EiQLrtls/6IK5v8KSd1
         uvOPSWQRWN9mSCcuG73S2/HWk0AEmzygirO2ApdtZQiR87alF4rHT2WFExjUc0anQ7yT
         Uv9wFFlbD1opgibVFi7J63rDCyAejYjH6b9LSaf0t9Z0mal2HY0djzrrVmc9ssCAqPlr
         rTtg==
X-Forwarded-Encrypted: i=1; AKwUvBymW+IiS7KyepYRnq0jrFPXBmsm4+FvTs2WKRE4WCW3PKcCSCDlVNSE+pGXV0QsJap3/dguqUhBxS53nN6v@vger.kernel.org
X-Gm-Message-State: AFq9FYIeKmFniQ55ILJemf7X3HR7HiUQCkbyIkfTAjv43/DXTQZfXbFd
	FB9uMGFx5Fy6wM+Af2pZt25xV7zXE6oUBSJIpcBg3Wg4/D9iSOjDuab/yzJLJDp2DDm3XT/DeIs
	FeFuRtKZ1IXkegvDJg3YhyKuUU2LOkDuXqu8fydQe3rcAJ6FE38GbYooueQRX1RVMDAin
X-Gm-Gg: AYBFou1+6Ytkdk6Jopo0vynE1HlUe4eJltUbh861xAsRQrr2CexeVbrI39g1Pl5lSO9
	rDusDmRRXU+Io9MwPw8l0yCvyhxGkT1R7jh6MAQRGq7szfNr0hIPMvXrX143gpSf1bQ4V7tYDzl
	kwcZpAmBIB8UlUOIACyr95eW/L9BRZjRljrWxvbZepAgXZG0nouYaVOub5XGyNjY4X68NqAuVSW
	2Ltlm9zgR6T2PEbo7NlkIVAYttRAm/E6uDLnAMi5tPvsb9E5A3RHaMQTC5GG3q2ucRhR1CHVQiz
	gchSrPPKQNJr2SChYzsVzP7sluo30T0yQ3aB1irnNSvGgTuQEWL8I1CZHHkmUTta+NO6+8vF+I9
	Pp5xB0vAsaob6DC3nA6qLk8Qy1xkX7ergFZmfjIDJ0RXnbEnefhR0Og84qy0tmC2Xi0FjmQh75l
	zarG4rg99gGqk/KWUKOwqIQCQAO8IX1YTMgUhZdcq7CWJD
X-Received: by 2002:a17:902:d485:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eb003dcd00mr40685265ad.16.1793261286214;
        Thu, 29 Oct 2026 01:08:06 -0700 (PDT)
X-Received: by 2002:a17:902:d485:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eb003dcd00mr40684995ad.16.1793261285721;
        Thu, 29 Oct 2026 01:08:05 -0700 (PDT)
Received: from [10.133.33.227] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37539sm30068785ad.49.2026.10.29.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:08:04 -0700 (PDT)
Message-ID: <b8f90e57-4aca-41ed-91e6-27fc072d98e9@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:07:59 +0800
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
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sashiko@kernel.org,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        horms@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        tao.zhang1@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        jeff.johnson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
References: <20261016-qrtr-add-shutdown-v1-3-e1cc01ca5919@oss.qualcomm.com>
 <179248895481.3135.9231497728918795508@kernel.org>
 <20261021133531.55da7de5@kernel.org>
 <9f76467c-5b21-40a2-95b8-e91cf1e1b47c@oss.qualcomm.com>
 <at9XxF32WiKBEJQY@debian>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <at9XxF32WiKBEJQY@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae2fee6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OT3QJeMhKsL16cy7qL0A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: WMSoAWy7mTHlrnKKIRsjHcd3xhwvhI-h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX9PUrxCPdZpQI
 IboQbHBHpvGEqQ7DDWKSxJaTePpheuprDYoNMjabjUIVMt57128TWQyRZoOAJTVozTL985V0km6
 dpBEyQGLrcUEimEUV5UOdeMQTDGIfi4=
X-Proofpoint-GUID: WMSoAWy7mTHlrnKKIRsjHcd3xhwvhI-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX10JVsz+fn9rc
 2K1l0a8YiL7t7/zXaKEmyvktlijqUAeLUTCzZ5mDY3ek89c4pidZUQgiO7fvPuhxVYA/WlC0poJ
 j4neRgSDZes6KC7jofcEtU4SskRTN40ykkhbyJesk+Drcg+FneCjuKXcEFggg6RqCItPhnwgdF9
 mbl9m9V7ybJ9C54TfqL5VyyeFuBNLD3rgi5nJxccyDlCckgUtzu5jpGXWN5ytPbr77xwGDTnjsm
 fwW/dzH7wEYHVsGYH1rYHKK4+uFAMiWrdPoudIGVOCvRx5ocZChFvXNG/7Fz858FcmnbqQeKdhz
 /5Etj0N9/Tt4+QogNYka/sWCC739J06AJ90IgJft5l5qVe7XGS0zjjxbzAxgCTgR30I2PsJ3p94
 LolMKuPkAxC/k7N+2SLcs1ywoM0aMM8plvQ14fAgH2IYKmqZodozP6ol3jYSinonsPgGbIBPJDQ
 ZrguH5PWGMySQIio92A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

Thanks for pointing this out, you're right. That is actually what I had planned for the follow-up series. Since it is outside the scope of this one, I described it as "no way", which overstated it a bit. Thanks Chunkai Deng

On 10/26/2026 9:53 PM, Manivannan Sadhasivam wrote:

> On Mon, Oct 26, 2026 at 06:23:18PM +0800, Chunkai Deng wrote:
>> Yeah, this is a known limitation and the commit message calls it out.
>>
>> The sender sleeps on flow->resume_tx, which hangs off the node and is
>> keyed by destination node/port, so the socket has no way to reach it.
> It is fine to defer this fix as a follow-up patch, but I'm not buying the 'no
> way to reach flow control' from shutdown() callback claim. Why can't you just
> store the 'qtrt_tx_flow' pointer in qrtr_sock and dereference it in shutdown()
> callback to wake up qrtr_tx_wait()?
>
> Storing the pointer here is fine since all callers of qrtr_tx_wait() hold
> lock_sock().
>
> - Mani
>
