Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425504;
	b=lbnlwpslDVpOU5/11iVpVnDj9PHFiQe3L+CS9G6rVSw1igyViyGp5Ox6NeBRs8NBmW2/
	 6QA4GDcZWgGy2UQlh/PFnUnLqkCRQ+WCG3fd5hpRm7s20JYMHZRnon4ihnR1s9ELJBqvn
	 P8yciQaeFoGJGQeFv0fvqvUaZCP1VRdx/oo4WhJJlIW9zTdCvUr5XmsCuVDqnzjKDwZRT
	 N1ImSTvFT+FQVLAjB6Flfjtwfe4QOD9i+NfCtIIjSWYqq1EhyXh2pA4y26758hqbMRqZO
	 8zpym904Jh/0+QWWgKN06SUcMAO4Fg3567m2QzZ3WsKtA1UgMlnG2ShUvDe76hL0oLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mSzMQRsg+yqrEBzUwipXKM/+0J/rVsVGfEXY3Vx7ICc=;
	b=HJG9xTPPrHjojIzC5lSaeR/hBBrti4hOd54LrnlnrYV7yIxz4P0FZeY1aG3DJvXlyThp
	 NeT05+68/2eySUPzaT9YSV8buIRyjraT/BRY1cKos1iQbwriVijIRzjwd0yR9Etp4QYrH
	 jH3VxqrKuFm19usia/tO+nc4hmb/M0nbCWezngFyASAJyUWIRyUGTiOVzL8JIpHZW+tG8
	 LSCq+91+edEvfOtYZTGsiUY2xdcV/l/oOOoAWu2wsxGGD/TZDR2bPHESnd4vOIJj1oo0C
	 NxQK3/KOhDQeI0tIE8lOw4ix1MwLOkvcQtz/aQsTW2LaowGVlw/QkOGlXokWNnqZkNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xg1unES9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXSmv38J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E28606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E28606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xg1unES9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXSmv38J
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fx6V917180
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSzMQRsg+yqrEBzUwipXKM/+0J/rVsVGfEXY3Vx7ICc=; b=Xg1unES9jsmRSZyK
	HTGRTKLWVi8KzqJYZAb0udLqpQqOHo101z4Zb/hMrylrs4gj1UJyLPqVKcJZW2L5
	VHmFZvw0g9iEJRrddx4zxpqE0xU0BFzwHj5ic48N09PqyT9UNfGFJy4lkA8ni9DR
	mTLW9qgjJr7YoolBgiNEziKbgmS1Nt+5GVHxyxZiiHmBKCmrIIPZWrCn3WFNwSI6
	c3Flfq3SgAaGlMNyXZaCb24wZ69W7Qw1pOEMLRtxLXaZqB6fE1KWciK77m5kcvKX
	KT8KoeYt3QtTGPeykiAMNcoibkzoHlVLFcFWXom+FDmk0BSjfOPnPkTlFjsZWCKr
	9lHkHQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a0ks5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:18:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so3334962a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425503; x=1796030303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSzMQRsg+yqrEBzUwipXKM/+0J/rVsVGfEXY3Vx7ICc=;
        b=SXSmv38JqmEdnmaKjPzoHspZ4j1KgXye2tSGNsa58Eu03qy09fIlbqg925bJ1QOXfj
         X/WR7dOykR41g8MU3jLgLYVohDzxQOlGXlxiMr0rAGYS2ipKTCUSn8ukd/SrFjjPTF6J
         FZRaxxfTgWNBNFybRCm6Fi3UQ26Py9YK9sbwo82Acmxza5frbjNX47E1U/G6S6HHmWqD
         gJJj87dONd3Y5tdG1UI2jVaFGMj4vrBc0zkotCCgMPUnoT91+moKeH5KXzeuZoRBm53s
         TGMpS/g1/vqlgpkVT83VGG+bakmolZ1gwVhDzhdIAqxZ5Qzojkmmmt770q1dX0xZgRjM
         fFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425503; x=1796030303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSzMQRsg+yqrEBzUwipXKM/+0J/rVsVGfEXY3Vx7ICc=;
        b=GF1ebAerSJqjBvv5pzPGXTlQxzoIym1sYt22tJsB5uCPnAIlQY16EQOVMQCk/hF08b
         ThTPMg2QLI4rRPEBszEeYz9sYhuj7hU0xxDhPELGxP+RWxb5Vp9VbEv1BALnOadtWyzC
         Fd8NeOOJQNJuKI2WGxOelSF/MqKse9LKf+LYmR+Ekt4hoXNmAU2mensWzeYsQI52Awy7
         s146J7xdChks2+RJK6VXaP8Xjc44OpGl3F+GW9AoSMVCqbR4HFvITO0k4LC0tOL4Hfsj
         GZ06k+guPqhHVctlPnU6FEc0ay5Y7XgWdr2G1lEL3ptcNGEkZ7iSwK7J6+cD7v1HiJAI
         IDLw==
X-Forwarded-Encrypted: i=1; AL+hErFgxFcTlrwR7+Z/RinyKJulhXbSyXcC790LyvAqqn0UtT9hkVXv2QRiu81qtye8ZVzkaTEJ2EBb/wNjvDxH@vger.kernel.org
X-Gm-Message-State: APuU4Z/pV0SEPCwq9dBw7wGdpHvwCr1t+yZt1JrXTkjLXli7gIqxfoNQ
	p0mOiafoJhWVlI2wTgnc14kDXuOzqjrJtgIQ924ZvnaQx5wjGkOlrHQhL5Bn3iijclNZboQPIF8
	gcYvphtG59FGcYOWVeFf4086yRDrYHZrSzyRWel02xutCiFQE3i3r74RR4ihgZ5V1bpVC
X-Gm-Gg: AZFdTZfKJE16+3hHnkCM04RrvvIRp1S7Ol3whuv8eeViXl39PTumbzLIgUw6BLsEZQY
	gJiexfpjFhDb02CjjmGV7lCPsmqJk6Oh+yBIHXsvNoad4cVWDT0L168+5GzdtWFg/ZRlDwjgJM+
	2DvP+OJp5q/FVqwQXusTr/rib7W3ornRQbkcBH5hbUi5bOFXWe6MI93yaqtIVaaU/zEhHF5J6Ik
	gdx1fSj1RhtHU/3rx7mDGPLixLDaQ/913pONSoP/L2V0IG6ELdFdhsjd3ugz3I3HUjh7eUlXuXN
	zAqxdTot7C+V1LBaW1VEuX9xS2TzlrEz7VlltmL0hPalKiAw3YqXCaf1m/wnFJ+I36h6RkF7ME8
	d3ick56qvcyLjMjXxJsPYfKqFcF2wP+qE/1ry3bc+DKdH5yuJIOBPc75ODYhNa+9d1sVpMT0ogr
	jiHhXj
X-Received: by 2002:a17:90b:2648:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b41c95b67fmr9470998a91.52.1795425503032;
        Mon, 23 Nov 2026 01:18:23 -0800 (PST)
X-Received: by 2002:a17:90b:2648:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b41c95b67fmr9470981a91.52.1795425502450;
        Mon, 23 Nov 2026 01:18:22 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm16839831a91.4.2026.11.23.01.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:18:22 -0800 (PST)
Message-ID: <8aed0815-685d-41b3-af2e-0055bc6ad920@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:48:17 +0530
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
Subject: Re: [PATCH v5 2/3] tpm: Introduce Qualcomm TPM driver
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
 <20261120-tpm_qcom_driver-v5-2-3d9321ace107@oss.qualcomm.com>
 <awGtGoxtker8a9kG@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <awGtGoxtker8a9kG@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX5oDFjXZjdG3I
 y9VT5WyUqbxoNyM7u3QPNhF72VOXVdaLFwGHyvI8G6JFFBFNb3JwYf2ELRDlEAOAb9HoHLjnMMX
 RIFSDDEy2JVeCXyEHI1Q5Sm0fvEq3f0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX+zXoEg1DIDuJ
 lsQMpeLDwH8yEHi/mBgFLiIhH98WzrVl/wxttRPq17wCfOIDXpOZVzaNMcGBqNk8grsbzOgFdq0
 /erydGqw4lbuejxfzbYL8PACarckVgrz9FjFSa0QvQEVTNEgrDyIZiZTa/viJrO7CStm/eASEwi
 8COdT8bjuUm+6yp2t+OAYjlCSQ0JPqZu5siQNmGijCU8LaZfGI2gULxVzpqeuc5DP+2rycwj1Tf
 BkB6w6Ghzvn4qlzhLpC+xblz17Y2MkoasgsCVK8CnIXI+rpnruBG0jchhvuH03clJEpw46V/gAh
 so8BKlPZXqu7Lf7tiEtyeo/sSx+oRGYneNj0ikhTf2/WAQTgpDpZbPQFkZfT23gMG+oRbwi1FlG
 W4zDx3rfBf7I8WGf54QNL81nryPTh4erInX37JrYVMtBw26WsV0dvkPiDwCCCcdgXGTuFEnitIF
 RViIaqJHD/IQEb+x7TQ==
X-Proofpoint-ORIG-GUID: xrdJFMivcZ48jlgjQTXGehUSONxXtccC
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0404df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=V7dZqg2nRoFFyRf2opcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: xrdJFMivcZ48jlgjQTXGehUSONxXtccC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230036

>> +module_tee_client_driver(tpm_qcom_driver);
>> +
>> +MODULE_DESCRIPTION("TPM driver for Qualcomm TPM TA");
>> +MODULE_AUTHOR("Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>");
> 
> MODULE_AUTHOR() field is not that useful and nobody keeps it up to
> date, so you never can rely on it. Not NAK, but just underlining
> how litte it is worth :-)
> 
> Copyright and authorship is anyhow recorded by Git and
> MAINTAINERS document.

Ahh, I noticed couple of other drivers doing it so took it as reference
and adapted here. Seems MAINTAINERS is updated correctly so folks can
rightly reach out to me for any dsicussion/issues later on.

Btw thanks for mentioning. Will keep a note for the next time!!

> 
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
> 
> 
>>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Thanks!!

-- 
Regards
Kuldeep

