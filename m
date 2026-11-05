Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880477;
	b=t/36VuMFOJ8XHyNQ+gvASjXC37CByJRu7ryhbJ0g6/Ac4ihIIulPFY2Dc+iGUxHXHXUK
	 pHLxyz826ww3J352/LXhbJv00w0vmf3wOkt+OuNIP3DTZCMrp5vBaPvAfvqGAi5AlEAe2
	 J5K/0cfkfeWhuLhAck/CrBpGxAD90M+nZDg1gpIqnHOiDPB3x1c/rHWyCCxpq4m2T/9o0
	 sZNfqVg4wLNyNYUp0r9UoC3LyA3CARSBBm5/Ux2Kbw4pzT203X20ZwcBly2POtr7shBq4
	 abWHePZL4tjdTu9e4/Emftgrgro+iSwcJtHqI+3R3L7zhXKjxDZ0+uDo/tEaEpiNeJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=;
	b=kx8xX0xY3yuzYffcswiepGi0BRPZXp7FIttut5WfYRHougCqYZU/NQx26AjrIO5IVAUC
	 KCFIpyEQ6hNlofUJB1QtPb2FhMOChyjEIdoonhXlNMBVL+Hp6G//aQtDNMH7ETNK0h5WJ
	 B/RkxO1218zKM0Lqr1IdKuP9InFAEeozl8tGs0ZiYANxPPL9wF+Pt6uQNzVZOzm3DmRys
	 GJ6CEOjmDcq894V37znanA2vCu4Bek4qztFYIak4dnVo/XHUQ6mQK/awnR9Rtib+d9L+I
	 gXxEZQmo7ptYj9NO/Vi16uE1yQYNB+wPUiaGG8VIJlyJPTh3kkd5ChO4tbDaP2P2+Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPC6TXI5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKoCkxAx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F29A606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 12:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F29A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPC6TXI5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKoCkxAx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tOwI4084510
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 12:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=; b=pPC6TXI5k5cu8c5/
	euzX6JjZXtNTvGDBeZMbjIlmHSE1P7u6icGrgwzL5C1ANqc/YaRy05NDQs0zUER7
	jHHAxcSh7FChS4GUGbJbbrCnPnurwllr8KoYXeHgzuukMNPp+0ZZ7avU993oEDrd
	ykui36jN6sTvOMM98+UBHE03QtlWYho4lpDgtzEnKIZEZBi4+bPK6ZpXspofOiV8
	XIBSxgvI4c5KgR/8RIZGT9Pbm4VlVzA0PTRDxQG+qw5zCvSv+V+Dld9d4Fi0QRjW
	kf7WUo6rOdtr8vUuVLJcRezBde6yfkWstlkL2JQ2bFl4PisExp3g2w2bzmR8o/G/
	DYTShA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkrhpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:07:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaabe26601so132137e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 04:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793880475; x=1794485275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=;
        b=JKoCkxAxiX6vkb6QBj6oxRK797XS4OSI31dQDId+QaSLCgtYm7pQ5Nsc7OvRzoyjII
         hmxsn1b/vhXFltb2y3QJ747Z+5iaKjkXWpfmpATVkxTQXM0FUWPMErasa0N1hExne+KN
         m/C527VtkzpKeIHpqxyDXB+tmGRCyAOHNM6MjZu7VNQR2XbQfnZlOR77F1zQhyPU5cK3
         rIVTCrzvQsf4V5UBAaMEQBnH2bC1w7m9MEIrpSnQIYsYU4IpGxZ45luVEgdKZ6QtVmHg
         lm27Ppp3d1c6QY5GvBgLnlJ/S5tB8kDIoHABEY7ma5oZBHaf9n+kjdIFHsRYWGuWR3ap
         8p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880475; x=1794485275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fiu9RClNGooZHVgoSy8QR/YNbVqqklxgEaTF/aMjok4=;
        b=oes4STil/MVzPj1FS/wfSBLDV24jfZTzo54wjvZ4xmkS6CmGRdd3Yu2obJ+qYd/rdn
         QLlsDx/tsXAT65YXnOyFcgsspThwNrUo3WVpZekBBmdnpTG06VZUjbprfo2ROsypuv9k
         YWGaYjQNntDrl4loe5bkCLL4supE/yNl0V4LPfSDaoCb+oJzGC+f53hEK8AIWmjJiP11
         GO3fwt0jeRMwE+dEEbBN7eytHat7pZaptez/LD/WR4lPxXdGvo7RDFntUnsG9r06ck9G
         0Ods7pwlEn2eeQMS4fJgkvDOe8Z8Xy2zqlYRqZLp8WG2UewjmuUWtlpj1/V4qbX3klkN
         TtYg==
X-Forwarded-Encrypted: i=1; AKwUvBzZelAFvJ8N82Op1q+oc6E2et90Y2vSZz+JKld5Jc3WeTiACXPRxMimWKSJ2lYGAbpLPdKAM5COjtOd139k@vger.kernel.org
X-Gm-Message-State: APuU4Z/AVTAFzwSvQP5t4up+HfeMQY+SgCXnnKfXObohk/ptVADn//yR
	B+DmzzzwQfEq9zyBJ/OQ4ugXy2R192Y5mKklBU2hikggZBgfdXmlOMaEY4kQogz9aeLE49PEh7Q
	avbIS7PP7HR7nAeTuN7pXNARvERcbfQ7ciBlI0t4vf45LcdTkqcvWBVl/9Q60JvWGDdZn
X-Gm-Gg: AYBFou1mWBxsBL9hVrtwiFvZ0TUulE/u/YnGsChIn+eR0OUSlDishBL24/8p40kWZMb
	3tI+v78kPbazZu9LXC9+fkwxQITIQDe7bw5L+pCkcF2I6urtlnLQDb2EefPq28GOJo5s+GDqimv
	xckegLT2VTY2ClvIlbpUjHOdXO0Ij7aSfOrRGWlAIOeo5pFgdBl4hFyHsdMrXAeubuJ+0DuFKlT
	5nRyGK7glsr57HClFURE7CTbielPiaxKx5x85WBcW71e6DloyHSwWaQjtST34MXsfcN30osJj1Z
	sJswgBCcM8Y+EBB5tEDzJ6kM7mUhisPyBfigIgm8MZZCIxfQyhPSjAN+lHLnn0jQ83b1Z781dwY
	Abgvto+sqKIyxr8I8tP5k2AnRIeylCqzCJvgQiAjVSm3FITxgECvDE6G6ehbkwQodp9eM
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr9586244e0c.4.1793880475381;
        Thu, 05 Nov 2026 04:07:55 -0800 (PST)
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr9586231e0c.4.1793880474981;
        Thu, 05 Nov 2026 04:07:54 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e423a48sm170533566b.27.2026.11.05.04.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:07:54 -0800 (PST)
Message-ID: <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:07:52 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
To: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfXzngQvdHUyAQH
 dKwCx7pHVDWJjR2NgIvV1jRqDiBRl4z2zZyceWZ+JhfxHai+vjV1IHQmD7naHRuWqONDImJKJex
 IM3aqqW0AeauJjPMkdIA+dKKxDJPZZxmuhOtNFJUPLyHZB5/dZPEu9o7m0h5IQt4K4bwtOH8NZJ
 EANiHxGH+OdqkKw+VMc9VCWDE8bRzOeGX92j2gTlejyajP5hHVtn6ruEv3vIV1Gj0wRxwXtSSZS
 YMRPhgfXWpfmLWq7k2Zw/H4PXZlWiC1ByDeby080Bk6gPAdnb3XQfDErlZ3+2gIjI9GE1DD/f1l
 cim/uXgjMb0iujgtfjDI5G7tpVRsgyDF4siUIkJxuGKtFHW27WcAyP+XE0qa9qx6rlXFaOv3VRO
 oPRf/HKUXPmkbNruZA8WXvbYdjy6ouN1a5Xr0y6vRhi4p+rvxijZLctRsNmBqbenCX+5uuiDnh5
 H61YWxy/mz5OX/5Xtxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfX0OblC/sConpp
 j2agvwK63anpJks/lOlTnY9fTCNlPZZZffBYYlz2tvUDJW0/9gRc/CU0eNACIfsDc9q8/X0AjSO
 w2GsQbHvw9+7b5RX4we8xBeB9xZ+ixs=
X-Proofpoint-ORIG-GUID: cX45JTysHM2Lv53tpBYsTjAdtkD0GQ_F
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec719c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=IKU54Xh4PqmdtQSvpVMA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: cX45JTysHM2Lv53tpBYsTjAdtkD0GQ_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050048

On 11/5/26 11:46 AM, Chiluka Rohith wrote:
> Add a DAI link for the DisplayPort RX path so that audio can be
> routed over DisplayPort on glymur-crd. The link wires up the
> DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
> controller, with q6apm providing the platform (DMA) component.

Why do you think we should only have audio on dp1?

Konrad
