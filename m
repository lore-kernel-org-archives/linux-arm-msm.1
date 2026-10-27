Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098338;
	b=jPiLv7yRxc+YhONuCEbGURF2Go6BR8ReqrLvWejv6+0imnMZo09eopvB1htsR3bANnyZ
	 fcA5BvwGMdZ4MNtrzpVltXz7/+hliWFfB72q7IOS+mHqgqOS8Mh9vJ8S0jnLqwgOLXOFD
	 Vm39q8scufBC44OaslX4dL4t0tbO0q9v/NK0+R4xvSNKYGKhVmPJPgH5yyoS4LDKbyCyw
	 wXR29WgKwThMhExO5uw6qyAFxSz31Bya001uuhVegOk0pr88Swoe4oZVHvYkjLROC7dP2
	 1azGQGSS0IbINr3SeGdxI/dKupxSxSl2m4Xwr18FePeGkeWsPoLOLMGkvvf4oMyjxKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eQun1WYgrR9Botg96DTC22QuOkNDBYx1ZtyTIErbOWg=;
	b=2feoodFb2Z/PSb5PWXoMc8o9D+ndlIan7MgrQy5JMHJJeZscrToC57UDLTbRPCfIqtQA
	 zi4UpE8/DtPebge0Reumbdb9EuInwkXjNp+DA9aQJ1AsabLjH7aaOwdLK37DXvYiq77VY
	 7M0aAJXXXAfjsP+HRlAKntBfFFy5fmIL9ZoGOsFAXaCH8G+FA3C2/dOHkcv+w5apZQuhv
	 +RM4FOoKxLnkBXkEtqUc6K2ehazWBFJtzyK7+5cqAY8MKS2eCXrRwIdR92WRIkp6q6ADH
	 5l88SGxkA17WHPtxqEM82ieoYE8O1jecM9BQmUwcPFpiw0ORyIt3hzgoxIPPG9XJxNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="W3/GEbK2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmfWJ6ie;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38286606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38286606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3/GEbK2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmfWJ6ie
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe5vv432659
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eQun1WYgrR9Botg96DTC22QuOkNDBYx1ZtyTIErbOWg=; b=W3/GEbK21xwGnJXS
	7vOGHCPSKcQmQfrzNMNnNi+tzmjkpVrHNHZ8hgEAKfoorz4ShKHUsCjqvsI6wIOr
	u8iF2pFwfNCf11XiA64dBmMnLY2oC4vSRGBLEOIh8bp3tCTOq3p3wmz0BMLM4xYq
	upnzvYlo3X3AUyOZxAsHlk9CpDBB79dsSKeohOhT+9PVeeVrnxgkLOzCbZTvnqjA
	O9DW0DOg3X2qQ3uOZcJaNFtGAp7f74u/E9rMzi4wCk9FzD+6afDeVWnHJXkuyRaA
	4RgFM8/9wN42QdHgOKF71ff7/sZGD+Rc/bEf1v+staDwN34QqMUySMw/+72L4RTn
	ZFmI4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kdb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:52:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so53146985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098336; x=1793703136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQun1WYgrR9Botg96DTC22QuOkNDBYx1ZtyTIErbOWg=;
        b=KmfWJ6ieP52Y8xCL+h85Ow2r7eAcFoLY+5F1I9MdCbXvLRN1WKOeq6Ac6WAy3Uummy
         /VwB7gJS07mSMiqOMOFoiJIbi4wYEFJWgXSPTnneUmsoZXO9YSDiZbwGEPWmtX+Nlkge
         XiSVDlAGLdHjz4evPXIOMfDQrpsBE+MNxPWWLxK76cgEXJI/Gk32WDVxkVpKnM6JWEjp
         axAus/98bP0cDpHB9aK2I3yx8T4bg3JTKECYZZaiWWfIiRQTqPYozRLlwBqa5X+Qr5pf
         fuiw5WbhE4Ry1shsmVysk8EPKF4GzZyc1KmPuufJA2uTye+ktg4jdVYUG7S+OkpDG+n0
         z7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098336; x=1793703136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQun1WYgrR9Botg96DTC22QuOkNDBYx1ZtyTIErbOWg=;
        b=OXb/D9QB8vprTXfihXpTm5i6YsfHfKifrAp82mPNTZOJnpn4UJ/JizggDVB1l/6Fwq
         ZRv4i/FCfQBJurHKYATxCrM6yXIpSzpEVQYe5D/Knjtu92OolJCRJFl4LZZ4qsn9zF/2
         gAoEUzBO4QIn9aENwlm1pU9NgqdqZbgucDlWKoRSy5paYujoZUQ6FCw1UStpjwPP1ydn
         yW1m+rTgXUAs0u6oH62utI8TmHbdxOaMQGICdqXgnPXbhL32NQ1IFp0J/1Jj4w5iKb+q
         53E61TIDyYRMbnTnkwjpMqSnOvvWqiS1x0kw0FZBOSH7uHLm+2/pAbTipidQ9YynK6fz
         XcIA==
X-Forwarded-Encrypted: i=1; AKwUvBxrm58WF0czdPH377XYlJpGhWbDSrOLxo8A4C872/wMhETYFZgixMxNpEjbZLN3kEYiaRp7PvJVF+myxBTg@vger.kernel.org
X-Gm-Message-State: AFq9FYLfg0x1bEwHlSb37D/WrQU8wR5XSUWp6/h2aMSVXYoESjw/q2TR
	oU+YhmKZzJRj5Z1u9UVbXUOaa0niROM5jRBk1bYwKv8qDe56wKw5oirnEbq15PrKD4E0awJipfc
	pWbV8w/wCHhl0ykNt6HqVE7A4475kD6Q+wPMaMQGGx8wlwbzuy6V3re63zjUZhcHwo0z+
X-Gm-Gg: AYBFou3/CuaGW80205e37VbxKx4/qPXyEMTjC+ltnk2jz0Ejr0cQPbLP46VEhkOuJ8e
	UiwDowL/f2zwSPCdLM+lx7UR/hZLUMI8ZfMtES/BdzVeoOG6CRVkAj7iwuylEbtSFRD3oNbcIj3
	bYWAR1mAq7A2gTMV6B27FvpX+I8SkyGPU0rGIPWKRJN5iySO5fToXyrNlEGYzxOnzZ2WpwnUfTb
	pnzOXGtwB2K4+IIXUj8Q9gYkErzxg2hKJ2oEmqTY4s7d1xWXIDiQeNFjO8yU9InXTtvDH8+jagq
	CsRpHjEkVd3yQ5+Eu03HppczB9vzSDgw3tu+wn/u7n0k+zf9+bjlwPXHblZ1597ZFJFwhyOYXoB
	EXT07UvM8R4Pf7oa3tt9vBQ==
X-Received: by 2002:a05:620a:55b6:b0:93c:61e0:81ff with SMTP id af79cd13be357-940ef7ad891mr1623964385a.1.1793098336437;
        Tue, 27 Oct 2026 03:52:16 -0700 (PDT)
X-Received: by 2002:a05:620a:55b6:b0:93c:61e0:81ff with SMTP id af79cd13be357-940ef7ad891mr1623961785a.1.1793098335999;
        Tue, 27 Oct 2026 03:52:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd11dsm4954105a12.5.2026.10.27.03.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:52:15 -0700 (PDT)
Message-ID: <b971335b-e7ff-48a0-a1c7-9f369a3ca75c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:52:13 +0100
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
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI
 bridge
To: Stone Red <redstone.dcity@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-3-dc_redstone@outlook.com>
 <dd999250-9b3d-4176-974d-97f0cf2fc19d@oss.qualcomm.com>
 <CALkEBsyQCJwoDiR_dnqfVynEUGBi-qNenE+1oAFADPC-6OOBZQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALkEBsyQCJwoDiR_dnqfVynEUGBi-qNenE+1oAFADPC-6OOBZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXwAB8pvO4p1hY
 D2/m/qxd5681T/jfJ/00uwf0KaqH4J7WTUxeS/VsKDm63Te9yB06tl/fu97wCFQJUUgwM1yl5HV
 VVLGJmIwZEwHm8LIl0hwc6XK31ZjOeY=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae08261 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4HeTtAMc1EHGcnT7IqoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3z0-lxlqjJC-7z6nhGUONoVb6qecdj22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX2Nm58adXtt/7
 xPGq+fQ8ZzDvBGw5jKm43gG7NbcwaimKJWhbhUC1erG6OK/57CHgZlLwf45cgrO4zYAsjQmaoeN
 DJf0VHX8qfe2OymLjzqLXRJl+W406OaSriIwxVj7hddIHZJJfc5xG5jmDXbsiMOWWYp6gv9Wtbh
 nak3k1NhYsPVfogn1/C192xthaJ71roaU6ReeXTcb9klEHGPNL+eg5WCjVH6XAUBIvA65P50kgF
 ZEBFcUTzHX7sanAnr60RDxLD2dz1WsIiW4m4K/KC7fQmj5yS4w30tf2taFNDxK5OzAs8NmEo35D
 71SaE/md78/cXJTp35pRdRHPa41JZsdu+gsLPc6eYME2A9SlmHKxZmvdrSWvXvw9jmRK1UFc/CC
 EGbYOmKCk29AVf4cLPH3/WIsOobY2TKKj0+W/cfo2QfDAh/+815LYW5lu4e3EkDq9d7SPpkr1R/
 EoLuf+FTCd4YBrCwDuQ==
X-Proofpoint-GUID: 3z0-lxlqjJC-7z6nhGUONoVb6qecdj22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/27/26 9:56 AM, Stone Red wrote:
> Btw, there are some misplaced `status` properties in the original dts file,
> am I supposed to fix them together?

I think it's good to keep the new style for new nodes. If you wish to
do it manually (or maybe ask an LLM), updating the file itself would
be a good improvement too

Konrad
