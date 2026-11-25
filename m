Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606646;
	b=OhwxogEX4Yo9Bzw2aG3uhubaCzwG1Mt6NcJ+zmBjZrrL3NrY7Miaqg/zf1AzbYXTzBl/
	 5kINlFDgGA3+DZ27Pza8DC1QTevP55HxOYHgUVkKXieopV18BJ5yLznBXG9Alq0iyBYMt
	 IZlDgW8x4dasKVhfmwhAHQG2AIDjZsCLX/nqq9s7OUQK+8F6VsZkFCZ8h7G+GrSHaZpOp
	 ydXdR2yMtxUfi5kUgAWCWCGxCxp4G+y+dZ1djfG9D2vQrCxtwIJO8u/GN8Tyy4MlvReIK
	 rvLTe9LHTH72nlM8JCT2Bc+GhfmorF7aJD2cOFO84d53LV3WNDKe9rxqn3lwfRcQayw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9VTXGJpWFmC/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=;
	b=j7BCL6TH5dAh6R0xIqYB6BNPR4dY1uglH3g0pC5WbgdzROw1iDL3/Efj7gVbpLem9dzy
	 qWHjNNYOg/6C7Ohfufe+7nMhmH/1iUf/ICcxeCVEJOjYyJDoPe8+nTrg3GHgsodoCViXG
	 8r+2kE+mU8ziSqpxCy8FdECVxUNSsB3TPNaFM8WzA4h+FjZZAeoKiVxsbddLOUhQtbLjf
	 WPhhijja9qlmjAxs0dfXpaKanZhovanb7Y5GDQuYvTys+iTn75Yoj/2ZamRJrBZFbS/r5
	 GMLZUbH3EKoeH5xEW0Tqpq/taUhkk+gonpsKhdvEHav5VrjzGdIxdlLe4dgKCLrPqMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZvBbmKc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJ3a302Z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCB6606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BCB6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZvBbmKc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJ3a302Z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mYF44034310
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9VTXGJpWFmC
	/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=; b=YZvBbmKc6OJ2tRxwr/7FDYNRNFx
	2j5d98N77o219gSqvowGPYymW31u+dzXCNXI0QNrYfyrzFIcOSfkj/p1dTvnGuye
	9fqDO3XWEZdZH4Rkhwsfd7bpfMZVt6UYIS0HGgJxEWVHb3vvkdnhZus5zTlTHk7u
	JbcLBNZrN20nt3Y4GNHhxI71qdveEp0X3AEKst4fCS0NWwKGhBH9NIndXSAvsAjG
	Z6WTUEPoBAVNZhgTD3zhSPQzA475WTcKd0oai9cqRovfcZgmWsc9CEb2/frbXuMC
	FgqtZUIe3cF+0waIW3A76BeimqCBzYXqEGlJwIyG3/Zf8A82IZcF9f99RHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjjmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:37:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4092b645aso4822008a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606645; x=1796211445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VTXGJpWFmC/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=;
        b=HJ3a302ZE0VnH/F9dpnH51nNFjlJczGndvaC2zLHHfXETeN8BAcdXiRVjN5SDPK3Xj
         NYDz1FlijB0K2RXUVBzRWeSLHCKHLgR9YY+mYISsVsNX51GFuPN1IAwFggNdZbqXWpzG
         5aHCJ3qCqAOVmwK0at97fxvkKp3dia+vnzhvV7SHUHIVJSfttQ/YqW6bE5GCuo/2sQzk
         Jwwte9IdhFo4/cZJrpAWcUM+x/wODVsUPkn7KW/GssTrwRv2F+nN1QlcLKmQTGiF0lIU
         sSA0DLr3BKl6HFcGy7Oo6+6NrSMVkHAqtxLLoCbzll4+POkxHBg1wbcRZVuUIA0/SUyK
         wXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606645; x=1796211445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9VTXGJpWFmC/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=;
        b=wWAB+hc8XM6TEzAGNQmO+ljJCH3Hz3Gd8M4FCes+9ESWb01CKffM8daPNAIy79M+Dg
         sgSj05QQFcEcnIyuSwLNJ2iguBTAzdh9zLWgnKdd3xqSNSbUb2V1/pWcD+7Iifquy8VV
         23mGgBXPi2dvrK/AUAkOGg+WL417LHIHoXOzD5CjX28iHOw7M5w/TfCXZjCFu0zT969q
         xzBd7dFeXe0KG4DCC6zn1JojOE49h3+mBtaefA1OUH03M0ASqeskxgBC2kQRQYkiXpm3
         DZuDMEo+mg6waQ+EIwH4ofyF1c7IBcXDc7YomsvCnYX7AqJQ9KDP4tmhT074q6lwcmct
         knxw==
X-Forwarded-Encrypted: i=1; AL+hErF8pHz86+apNr8fF/YyGBu9w60vy9dxBi6A1YP8Ns9qCV/WvpPMowcqHzllk0IGKL80tyHOWdwGCGJR62QX@vger.kernel.org
X-Gm-Message-State: APuU4Z8MqkTN2WZfrJEl6Paj0SR4sCv7Cy6eaLqqyHF55kWPznloM8vq
	kJICkyrF8ztynSi6o9lK2yeedXbWGuCHDOUqvQDvF3/XpmZPyDyyXP8eEtvBnUGCuGPQMRA/60u
	7HyNcmLoaAy5i7qDyIRo1+XNuBEvOu0SPy6sxSU2rboMO9oEhLC6mbfLqfVWXmJvDJXtL
X-Gm-Gg: AZFdTZcyxzUYtVb4N/06YIyTWWC9Vi8w/GYhnujcXBcFnRZGHN+nwFwhPgawdFqziU+
	WJBYh6qDbas5slq3ABJ4+8Z2s3gR/7RiYauAJCoC0UNJFpG5Sa0//r2sdj5PIKRmXumEXa3eLH6
	Aql6bafru8NSn/SMrb76Y2HjLTNDFwiuA2RcKHUDmHaQs5YWiuskJaQvPD40gNFprmHXfnwwSSA
	FeLnT03HgANr0C744zI59plWyEHKKfskAkxmVRosgryT85apVwoNcWeLqBRUI5vOXX0u77LLybG
	daku0lgamde79vCoz5gX2cYmQWSwqsat81R6I6Ob3fzbaWmXT8BDx8d9XF5yemPPKIS5NifXHnF
	wIdeU8/Tlh+G1HxLhDb5vTVUr1UQqxRVEW8Xb0nt7bcx4n5s6U803Kz6wbTH+M9b6DED4K/4oVr
	NkwHFYtdhNSA2H9Pm2fjTbX/t0coLGoLKDHt2zBKQKoToAs2XyGhZ9hjU=
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr17722226a91.54.1795606644800;
        Wed, 25 Nov 2026 03:37:24 -0800 (PST)
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr17722195a91.54.1795606644336;
        Wed, 25 Nov 2026 03:37:24 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm8697911a12.9.2026.11.25.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:37:23 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Seca Ride board
Date: Wed, 25 Nov 2026 17:07:17 +0530
Message-ID: <20261125113717.334604-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e07f2f6a-31e8-4d7f-a533-c55c51237868@kernel.org>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com> <845a24c91ea424ff30faa8e1d357c326eda2e5ba.1795517711.git.yadu.mg@oss.qualcomm.com> <e07f2f6a-31e8-4d7f-a533-c55c51237868@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX7+HvJWbQslJo
 6kOpK0i5xuTzASz4vyBdIv0w3Aq8vrDoQgHZ0VpO3XpZx47ar3RKAJkGaITFc22rQDCCJnPZmRd
 ZNH2xdP0dl7l23J1w+XLTNqCAwP5t+Y=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06c875 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=GTQg-DUb7hVcNCLWfvkA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX0cQY8AvOBfz9
 dMX/bqIp+PXVMKHUMEOban/pMPImVggBbG/9Tls0ZgtdymDmy+Gcjny8gqAW2oeoasxc0h6dUPX
 nWveaGVu5UU1AygzMGxHcZ8xJpx/TgAPtjTkboAesOLE4ZTjuyZESKTA1dx5/qbrfH7R/YJDbod
 EdFsBXo7i7dwffJKNfJ6xEVFbvRQLo/ym63MSmocP/XdIkZXIAweJkgCTVpkbVTvq3ryETblT++
 w2WC5doqKAeK2ODBTrG5H7HE4i0KTYyv8cAL+q5BOFlpJQ/E7KIPe48ELDln8O/SH56/eTDPUgy
 0CS9jmWOqEK91HWXYwLELSxd2mpWnZoVIusA3xOIFiw/jJlDYkXdAWDIft6/t0klVlvSfeL7MSI
 hlkA7qNMb4WpZcXkT9qOQu/4fzG7uHwlJYCqvdalDgyDTZseVUJtigLiuj9D2kXoLz0klvGEFC/
 ehi8efB++YvfkmrBw6w==
X-Proofpoint-ORIG-GUID: IjN_pIJJL5POFWueVJFiFwmrg4XYUHr2
X-Proofpoint-GUID: IjN_pIJJL5POFWueVJFiFwmrg4XYUHr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250046

On 24/11/2026 16:47, Krzysztof Kozlowski wrote:
> On 24/11/2026 11:55, Yadu M G wrote:
>> Seca is a Qualcomm automotive SoC. Document the Seca Ride reference
>> board, which is built on the SecaAU GearVM variant of the SoC where
>> platform resources are managed by firmware through SCMI. The board
>> compatible therefore uses the "secaau" prefix, with "qcom,seca" as the
>> SoC fallback.
>
> Incomplete, missing seca SoC in naming bindings.

Right, v2 adds Seca to qcom-soc.yaml. It also adds "secaau", which
names the firmware-managed (SCMI) automotive variant used by the
qcom,secaau-* compatibles. The commit message explains that naming.

Yadu
