Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098782;
	b=P4phzoeKbwHlJ2eOJuXSnU8tw53nvyLsPPMe+zmp+uMx3Mr5JV0FsFbp2HjjPRzTnlE7
	 /eEVk+UMFYzx/PJWXCqdmxwtf1XaMibEWkGVPh7d/ppDzTPGNRPeha688VBYKk12xVUSD
	 i4jQC3DvTzAAyXTAm7ww+kfeum7GRvt9iLLzIs0ULh1m68UGEExRSvyXoKiuWTZNzRy6i
	 jnC8vw5rGjexddKQuFKrol40fbcH4kay7aw3j/ztlYo5yUfHh2ahYpMasFCoD6eMxcY01
	 H+qJPsST1ZGQ5rX1Lq/92DEpqsBtTpri0z3iYiuaDHoWg2sk/i5vZQhZ/cKDtLA8JDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
	b=5Kp0uV98/2+0v3wLA3Uh4APzINcvMNbrvQ7sUcW92TI8yUrD72T8mrtmUjdwUgrGvIge
	 6wpY1hsBJCPxtSCjGyyROFdR31uC9gHUHrbS9KXlZgLeNTpcebhNvJOZGrotSOX9/rJAZ
	 dWGXMAlTf4ZXeMWj49yxRcREF7eHhMjTVLDi0bXJHXjQVUMs2dpN/90PXLftXAeBkfrYB
	 gpfig2KHjRmKvFhgyfxirxQaS2hbE0HxGEqvl02C5UBfW63S9WoiDeW237iF99hz+bsfo
	 n2snaj0xAxNQ9IFfhaNRwL1LZekQjkLuLo39ksqpbXIDfEeVPMiEbLZbypcDQYAN/ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFt4gceT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmh8jTAN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF31606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFt4gceT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmh8jTAN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeTHb1428073
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=; b=CFt4gceTanHmuKRI
	CHJVPXo7/JyqGvGJucuZv7Nuj9okw3JQMmlQv/8OKLlGWBn9uwqU0SIIsmCggkDu
	R+dvqXwLCGyGCwAw5EaW5RupWnusaBADigjAxrkdys2eGMu9tKDdAtNbyfBnnZgt
	b42StvxTf6j45kaztebp+T8nqvTS4jQX1+9GiBNnV1KbG86UhGcozOWMT4fIA5MC
	zXMpXPrMS2ufCP4LED81iCfgDNNmjzUzs3OhbgVz0yNyYb+9qLx8ldJuUEKsuQ97
	n1ciZN+0r0ABGx5B6/k0YjJFsc/v+GhTYc/a/yEj0U/oYRdMckwDunqf7E8SkqhM
	R7pqtg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmb7t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:59:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso15669521cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098780; x=1793703580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
        b=hmh8jTANgqk+4t/Y+c30HwqXAmDGrjspn49L2oJndDazaSHNAhQ/1icKsxiK7ksFWM
         6prUMeM++Tux+RP37NyRJ9z2JSfscXivpQxwIiFIzLXCy2456sQdaWUYB2Kfs04hcvEk
         qly6LbGT5GF4IMYgnQytzXbP4eedfu8HxHqChatmkJLaztzvnuCFJLM1u+qzqHEUP/bo
         IOKLWcSIg3LljsrkEkxoUGBCv98kR0InDCqNp+a+WaXD8JK5Lh9DTabneWityZLn/cwy
         neC+MAQeTMFQtkxKTnNhxkVOGnY4FXoeSPdBgq4Mz7B2JKJYEEywclnyDsyk5VAaHnhJ
         iCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098780; x=1793703580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
        b=s9MpL78iaYea4WY7hz+ikFS1oJviGMWXg73bAsj5xfmttwnRlbVA8n+oXwZ0FEeK1J
         AQjkpBotsEvS+z+ZQQ1elq/D3qNrdsfGmn2J8mdGiHt7baSAVWisB3vCLHke6edFGLEO
         mPtKEEWq0ebLmDopyaHGF+cIUAXZT0QlfQ+4ngvTDb2yViON06x/uDb/uH61THV9GhY3
         0iX8UbCzst6PyXqBQ6jYTHXwF2UN0ItTr5deOUAB0OvuMCDl4FXVsPQL4ZDiy9jLhGTp
         RpPyhtBCgOCgyGqNjLCvULTDDMj4mexXVqzK1BLpUmcBIlg67RqM0o2ISrNHSa2aTK9+
         VdEw==
X-Forwarded-Encrypted: i=1; AKwUvBxVBL5s36vTwoxQSTgSMg1Gefbpu4aOrm7co40kA1PAPC8beHgjUMN0RaF3f3yA7TsvjVjvZvc1vS9RLZPv@vger.kernel.org
X-Gm-Message-State: AFq9FYIlg9GysueVKP8Z5TcY7AA8G3qBEz1rQUWV0TjcUcRNaMLLzh3Z
	NYU/NHtjDlrYACf6nZonuEzjqWAGF7voD3+8zpoe7bhyiIIcz9yhCjRuWS5ljkhz539UhIveMuU
	snM/4fHKPt57WA5KImAFg3muMTb8jCCxCg9VMbYREvoi8Q6Zuzz4gObHZDzKxIB+2P5LS
X-Gm-Gg: AYBFou0FK76aQQCacHTJLp4jDZ55AGB7IO9nE7Xj/iBkGH5pMVyouAsfKGPKjSvE64I
	+FuD2maAXHqySOE2fiIqdcNzzQUw5LTPOpnczfKMIX5Hsc30PN1eAQt5zi9C2XY+w9Wvy1FIvMC
	fVhzM911eM/MaC7i9t8KNNCWe0Ky2dICLxWg20kFk/ZDe/lA+KDrx5fEx+kj3ceNcZsFuR8FRbM
	dqvbrDhvMeg5sjRMaCmOFg3/Dg182328vjFFs24VSsDfbuMtdB0vZxw+Fdy7LWMqxR+H1H1/44t
	+dZUDR90NuaQP13M3KfJq087V8ryZ4YzEEFSc/51fYffWUfW6P58pUaqR11RCkHsoNke6LDNrTV
	cpxFyKkWB/2Yqpv//To3Erw==
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1438986785a.3.1793098780241;
        Tue, 27 Oct 2026 03:59:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1438982785a.3.1793098779662;
        Tue, 27 Oct 2026 03:59:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd28fsm4704987a12.3.2026.10.27.03.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:59:38 -0700 (PDT)
Message-ID: <fd27ac24-e96e-49d8-90c9-019275c1b541@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:34 +0100
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-4-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX42FKVYjNPxoo
 ktgoPLnnh02E5qgqA/UP/CeW/jR36uwXJG+apJmtZMurtc/Rym8qLpAaBh6+k/+DxVwS7+79yJS
 SEvJaHOvjo91MoVLc3t02v/xhFII+gM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX0fcj74XRgPMa
 mzG9xi6k0DUg6jqaG2qlgC8jiMNR1s/OWjoAClM0R3gZXCsB+5F7Jhu4jH0wjAD8xZKg9e7Rml/
 +wRaGPkawI2HbVrNRudoP94owlfSM+0W8X3QUfm/pAV6NMNIjTMECCA5jAPrSsBGvnrX4Z48hLu
 BOHI5J5G2VelgdZZ7Vza7V2+M46ielQQNNrIKx7mNaS1p0WgbS/wM2AnLOeV2n99ECxlwxy/to3
 56GNaEH7FOnOt2/0zIhNS3cLhAvB4iiGb08MiWfWCPM/0T6EBVwnlsxSr1CjVtUME2Q1JKiTVil
 xTANZ7nGNyCUEfGRPerSopuLySEhK+JEGge/QnQuXsiBjGOFpAVPeqC8+aXxVN9xomkdzeVxrhQ
 Z6uvAJSyme6Ox2lnCWMeoJlGdteHtoSVdAXvAFgPtMoW0FSOxqX330rrkF8itLRVbAEAsgmAsYV
 ZK/wJYvs7B1VQqxynkA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0841d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RnYB8WQ3oujroR9yDwEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DGJ148c4fhA06kmZWF0axCWSECoWjQh6
X-Proofpoint-GUID: DGJ148c4fhA06kmZWF0axCWSECoWjQh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> Add the CMN PLL node, it will be used to feed the required fixed clocks
> to networking subsystem.
> 
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
