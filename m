Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194471;
	b=nT0TR1PPGnHUWSAT2phT9LTHihfgwvbQfXvVyZcTk537KimI2fFQcLc5AbVZbKbcq5FQ
	 9zguz/go5xImMgV77JMAG3kHi9Z5wmJmrHTMaG+PedwLm/Rm60yvMx5fCPh2BX8z8qb5B
	 mZpGvHV1kbAWmxLrN+WX/agNYZ4qt88PhwodGtukepDaKwiri9XJzW5wJRuFydqLIr3ZK
	 10kbV1YxUmlUyq5YILb2LPUunk+AjfSAGx5gY3j12uCTiTDrzG4mRxlyTXJd/3aINOS8b
	 lz3EkFWgNn9w+wbvBzvCv7yKqjv9Ok2og/5IjVCqoJzmS4TyNEWdu4K/bmhRqphpfkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=;
	b=sgSfAECQE2Xe0GFWnKGiokizbV4YccNFvsmhPUpA+wfAhneMGRm7lWAgTpJx8uthm2Cd
	 nEpMvVzfaFJ7Gt+IgRioaW7USR6v9Mr+3y773rSFlLK0iT2KbDFQZG2NUsdZrL2M+4i98
	 73GHcSkPySDzEYeYo+3x7YN+Cp9XTFyXceIJeowhbDiSkKW32rOzivUOg6tDTzPKfJRVN
	 Ix2WzwInhdXoxVTxJQ/yk6FIIzfVt6/Z6fy5RopGalO4YRSPyBB7JowG+KaElV0Q95i3f
	 pq2xJyYGkkwo3p8mjK1Xmx6LeRj6H88DdgqtqjR6O1hmtt5jZ/sZd/nbJjgMwFaxRmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB+KMeac;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlDkrIVm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D839B606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D839B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB+KMeac;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlDkrIVm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe9Cs137974
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=; b=DB+KMeacyINPVIWQ
	kT5NZdhoct3aIrjpDIznNJexwKqKNxa6q5TIvVYdUTStLB+2vG2KzJvoUjhPaTac
	90zVOeCfKAl+TTdjVPs9BhrD0l+GksHOv6Whwh04f4JrsSH7dElj4dy0wLUCPJ/I
	CLxoWmvNFazPX3JVe6ksWPnrXzs0NwaB1vNv3uhQkz2lTiFwBMAvGPqKe/Y04YnT
	U75G92ssmXv1m75abb/p6gIpLVrunrIDxIi9P1pTzpYr8/VU+VaQeFPMRNF3HkpP
	t2McDg+SPQw3fD3EpzHpurjk0YBYnDPStWUcgSJZxfp+AC4PgobPOIttSpKWG+tn
	TJef9w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92nac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:34:29 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ead2112f11so49018e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194469; x=1793799269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=;
        b=OlDkrIVm2S8cGNksjIHFd1sHDUZgsvgAwaXD3lw1KmyQMPWpE49FFZAbxmrediRnnL
         gNcnzke6dTJDFZEbnbxUVxiWDmpJytI9ya0LR8sU6H7t7UpQWxvuVRSICRQ0/Z+hED2S
         g75GZ7Ax1QBJ3+qURK5aome6HU8az9mIb7AWuDujFmOzkArFt7ALjIcUkdxmMmLGlZu2
         nvJBIFIsqvuvbf80ieSzT9cQue7SVQhnGdHnKKKWlJNYRWTGK530+wtlhWaBKHnRSyMy
         eQflYUknpZj4hGcqXFJroZGyyijKQBNob+oaXaV8d7AJP4mueCD/hRgw3W2swre++VGi
         kCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194469; x=1793799269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=;
        b=p4Yd9fMFU6tN/zGiNjrNHD9DkZeXmwHh1jKE4/+s3V6MsBfU3aSZFTytd296QzMxRm
         T+9oSCFcCPduLMmmTT+rjQ3Hn2jzpoPO/z1DF8NLgBy4fZ0/+ndarsXhm8hPVRFIr37b
         N11bCPQFK5sS+P/qsG4PvOsNI+jAAgXWlE+xl7JU70GBjv8efRqNyh05sadCWyDq81qA
         zxlGvpJ7BGAREVel5njnCFfsP66IP+T7I7YYi/6DLKueewaO6xAoMCWBziperbinOx4n
         oMYPd2c9MCcgBu+bmddlBzjTQtGbgbQzxuq65XnsAtQGvn4RxOBJ+N3ByKxObdozjp5K
         7VtA==
X-Forwarded-Encrypted: i=1; AKwUvBwu2iuRY3hyteq+//Db6LuW7FW7D05CaG94h4R9AgxpOwcCx1vnNRLQRlrBgoTmz3yB2Z46rwC9pAyjtMC2@vger.kernel.org
X-Gm-Message-State: AFq9FYLJmlkjk1MtNFg4Bj9ZINgbD+bdSYsYg+QRsnBYLaNc5yAy5kDl
	zDvW+K99ntpU57q4l7f9Z1mfm72zg7Y8Xf3aiVNHmMYxISnvZ2se4RQhV74z5tYpPO3ptM0YxoF
	ccPUFCHG6SJS6urwvu1EALevYaACOWfQbzJlo3HStbfympw/1DblV/aW0XG4E7hBMhHZdJncHLC
	xZ
X-Gm-Gg: AYBFou26gFL08c8pdrg6V2sicwaDGl7HTAtooIg1xCWCnWUFipZAxFHZtlW6kGJYFZ4
	7AJC5gIVJXoqaqbWpQQteHtIqqYiMaEJGQ9daJaFdBVFDWqLYpXJQZbK14b1TyUlKMwwf367jEZ
	+qW3y5gVeQY9Jnw2MBU2eNDT3t3/0KJMa8ddssvZeNs7KyyjqZ/0f/f/H/FbcPMb/TBcqo0yFTa
	g0khA6hAMHxRcXcQ+8Y50DjBTu1VdScUkA9WnaqyJ2qyC+R7tlGqE2Bxb5zlwctPpp7bYfjdsgO
	fiWLZj9fDncjbYwC63KqmASx/0UW7zDpP5ylHlYd/1LZ1IFSRH0nPIagyW5cu7JN8g1lCoRpY/D
	ZKwZcNFKCrs6iy34OSfOrYqRzCll9YasUL7fWtldT1oHKJJ8rox5s2f0WLhfzlc9fcLcyxIw=
X-Received: by 2002:a05:6122:650b:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec4cad8acdmr895009e0c.2.1793194468942;
        Wed, 28 Oct 2026 06:34:28 -0700 (PDT)
X-Received: by 2002:a05:6122:650b:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec4cad8acdmr894993e0c.2.1793194468485;
        Wed, 28 Oct 2026 06:34:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a27a03sm31692331fa.29.2026.10.28.06.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:34:27 -0700 (PDT)
Message-ID: <f6727bfe-6e56-4545-b56b-b3cfc181a722@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:34:24 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: kaanapali: Add memory-region for
 audio PD
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1f9e5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iauIxC-Z2Ob4T7-dqesA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX/xu9ROIYg0Du
 hULaHH2bS6luUF/HL7sev4Mbv24QTKciZYcwZNdXrp2fvFSEVxeFMzzIcy7SOE/HHbsgwx5kQKm
 phn7gTYqD+0AFJ/zvJzkJZz/IXpENMg=
X-Proofpoint-GUID: 4Ebt8yZ0nMp3JaWir3NgSr3Z9-YXmz5J
X-Proofpoint-ORIG-GUID: 4Ebt8yZ0nMp3JaWir3NgSr3Z9-YXmz5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXwMYHA66Glx7Z
 Z7r22YvrvMC8sHQJJ+K+ub3PbR9+Er6Zyh7wka5iQ8c5FrJ9Va50xqBV341N4JbcVK+dd/ywaON
 s46AQvKTRt77RZYZtkCAWjobYfyGtImxLKmwY/G+lAx7Af2mXvxuHjDhJryJvFeIjPit4QM54JY
 GkuKejxnGhtP9xfNjp9XO/uBbt72miscQ+rCRNtDkJsbUDWkJl+fUP8FGeA92b3fccmZi5JUoNX
 KBP1HCZayq0zaUAX4sH/ZPcoafMFeWoL2c3qIraNwULdPsk3uJLmc53rnmhSlrUJFoN6DzEzo14
 8dy+Js07C6+I2msWByb+54YZeb0/DhU01cuhGwvJjmQOShDBQToUOlL/AohSuhnmWo+gs9ufRnt
 VsJccQ00XHnfz/je4dFa7KoIdp2JD8+AWNJUmc6YtCViCTHzBSqF+1TydukuK14AdiZwjAXYu8I
 DOZEE8Kc545YT6ABN2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

On 10/21/26 6:56 AM, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Make the audio PD remote heap no-map.
> - Link to v1: https://lore.kernel.org/r/20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
