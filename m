Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143946;
	b=4nH9PpdYUWp93Fq1QAfYe9HNiqs75f7xV1xdWyKtZhzBNmNUFmcJt1GW7JwILz7I9gJN
	 b+kalnygeecbfUDTKp6AuUqIXi3pJrbA2UzjjYQmLyXhFJEiuhwWXFjDTIYQyaBfwEUK6
	 yrAD+Kg1MumDZBNZ150UiLjJDWZTGIYlDwy3C+zpp7j0b8lzKqIAY8EeLNzSaLxbpXwGb
	 qgBaSSyGToY2CL6hb8h/QHqC1BVFCmH6L0ksQSpVTurfFJ2F18AdexqbeRYCklEh4g48N
	 IzQq4ijviVjA5qLEBXkfnIoTkDPi4ZxHo4RfHApYaou7tlK/qPe10QUh6+Oa84ypFNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=;
	b=D4DC93N2MXtyiA3DFWrX+AGYkMWMSNn4kJUYoe9JzQJFNkevlj35TH/KRKe7HRJ/X6Df
	 LEU3Kt26tDOploUAcy1JiqNVr2OR7u4gMueyvQcyx79fGVQz+auGKjWsdG1OyDSOautj+
	 O3kqR2jYLwdE2VoushXJLONUCFJLFEqqcWXPHEQEw0Uuu2VGTHb37D4URVDw3Jk+j+xd5
	 1YYjXlM/z56gIBZQHA5bWWhXMSFpmGNqAvAeAzibbHqdGai0aHx54L6pBd6q6G2+ktaT/
	 5CUjr9vBh2QtebNtCw+u7KyrrgaHe/keRrHOibSMrjvB2nWUP4QjZqIWKL3Whlnuahg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmmGnEW0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9uL2K1f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2603606A322
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 13:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2603606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmmGnEW0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9uL2K1f
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Afvms2209156
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 13:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=; b=NmmGnEW04tWw0qBI
	EJsLz5EFuuhZ3VpfFMGJEy2Fh+TEpjk5Shk6VAZoxSVrcyoNbkamFkwYKcYHIIvj
	YAXXqjAMZKr1L36YT7G4fcA6ZpdyefMzqLSLngEQqQptzeNjhJ8IPMspATXiiJDv
	hP2CxEprfTMBTpWDH9foSVmuHpPHVc7nJx0wpKra3E8Kkg8w84KYGqWk7suOiOup
	wg8bR2yB+e1QWA9N/99MltZnMIJf+hpL3oNKZaCJKuLMsbNR+AZwlFlTJUmQnBuQ
	qA9r4GwgYKw5LYYxAqkpX6oEVzJg/H2G5NibaCbZDVLGTADhN3G9uaUpY+gJsKv1
	9DJLcg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf39x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:19:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so376975c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 05:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143944; x=1794748744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=;
        b=B9uL2K1fBoCxgmDlUamaLqDFYw18B8AP3wmJp1FNBP90gJ4gYkyg+DEylmf2ufgbXJ
         83PEMvJNY80pqtdbipvJPvlM8ewfldop3OdqgQwV20Py5r5qZg/wtpjqa/rVZ7cNvTpL
         CdsiHqltF4K1ODvF2Y6+gpy4UoSRuOe9wXJOJeZ2GVjNBWb95XEtheU5FI4U6Mbc4H9P
         rWCWSWCwifme6IprubbWsi85OCfadnyHIkywJs3dgd4dWhBqdv32UqwLzvSJS+oVF3lY
         KWKMr72mrJr3V48pYJ9kqZsH1X9JwJBAxVwRKqpFRHHA6LiUXUHeq2Jq0BisTJRl2+4u
         sJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143944; x=1794748744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=;
        b=yNNBCJETS8bScUyt0le+zVLY3MCnjMigKTKyjkl8ojCclWGytoqZnJalaC2FFJovCI
         PEJ8ESQZyjebZjh/dBSypFx82/2NwOI65x1KrzeZqU0w6Dnc5bHAcJHOYdHO+IdGOtKx
         NYUFhxVvARb80rvKT+3ZGpBSSx3tZ8YRWq5PkROabfiBJkrcBwzHje1VpyZRfecFpyHZ
         LdVKR3cfphwSvZI3f6r02G1ZJGxm4JqXX9X20EkKuDAuA3RIOELtCk2iNSWv+fX5auIL
         O+MP6a3XrCD6qE9WkG1D6hqHOum0ohEJ+JFdUmn+Td8gMsEi124xbQ6NDdYV50b0ndep
         uGfg==
X-Forwarded-Encrypted: i=1; AL+hErFF0fqVgYNxpaNNKym3wYtXbMMkw/lNbIRBRh2GUaR8mtzJOaMLMp0HEgGKIVBD5jg2iklWM16dPi2qWkg0@vger.kernel.org
X-Gm-Message-State: APuU4Z+j9puoDBUGelq9hceDNHlXtWKOZIDzRprpNapg9Hx8iRe7TZWo
	Ffk387pqYQ7dd+u2/xzNpRf/JiwG8x1xnCPIFuPYraZrNvPr2XjEwU02qaTeM3/rJvGmEIl1Met
	Cs6Znj5G+uyI2heVCCHIEe3V6p+Nd1Oc55sM25Y9e10BHo36mNvvh4UlfGvUJoAMp/g/X
X-Gm-Gg: AYBFou29+IPnC2VshCbYrgTMNe3Id/HWJ0a0CrNQlJXry3GZJYxMOFIcPGDIp+70Hc4
	y8YxLY3oB7w1JmcoovUNEXAv+xxSBNUFnts2oqUOGnw8punkpasgojmeDLZRySuwm+JITNhMI3E
	n4/ez/OmgUt0iqLOqOm2PaVpeJMKQiZJ7AzgwPfonKw6y+191CjfHnM86n0Z0BnTpwFSZb+VIwn
	mcHRwniAHijYDuFtsuujCKHOjZV/goIg+jRcVhp5Cy1Hfvij3LM+y+SwPn48WGZ55i8WErECtOk
	PAUeX003v9zgBVFZgt8/qnL907x+KoXfojU0p7X/vilsMR+CI6CP1PrFrlk5UQJk9ih16qOcgcu
	K0B3QFfFcGgh1a1ISXGde2vsRiTr/K1hLcq6ssAVpYU/kIONjh0Xl0Bj9pHxz9u3IGgQQYhoK0b
	NkVko=
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr2038247c88.23.1794143944472;
        Sun, 08 Nov 2026 05:19:04 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr2038232c88.23.1794143943894;
        Sun, 08 Nov 2026 05:19:03 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:03 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:26 +0530
Subject: [PATCH v2 05/10] arm64: defconfig: Enable Qualcomm TSC driver
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-tscss-v2-5-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX247IG7cSXdmc
 94iRlcJJDGsPoA4p6SLn16AcJllDmIFgoF2Qv9Q9jMECcLtHha+PZXnTiWVhW0JcVTU7yIyLzdG
 l7eH1Vq7fM/Q6IjrOld/h9Swx39g9GU=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af076c9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwNPhHur-d9dQeroUnUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 3LvC3EtcB8gsG5kIVIKuntMvVwMmykHO
X-Proofpoint-ORIG-GUID: 3LvC3EtcB8gsG5kIVIKuntMvVwMmykHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX0K0ddPAAwLCP
 y/LN8WW+tc5j8a+8yLe883TPIBs7xGm8ON2j3nYWb47Rjumrnxh6XpvFHC+XmJlppKhjzF4P+L8
 vfmCobfslSQKGzD4n+H7aO97yoPVfQfxCuWvZwqUtMa7N6KpB7RG2s6gaD7V3v03Kthfeb6Rnq2
 iljhOy+/4a1IPN06z2rtwyaqSVRpLEKIoubZ3pTo5chFNck/H/V7D63ZizdTHKdTSKUfWUIZyIC
 MiN72RsjzldCCKzdwzRnCy/XF+wxj2Ig9jVHumV1CZn+Is80T4iQdbAVLjHTbHXmbwQN19QL5L9
 YrIQstB5ueCGfrMd6vchKyFuSQmvdF48VcmNhEvnuY3ssmfzK4wC15L1BFQjFusYl+3M9rrmQ9n
 TFLiz3py7YJHrupAKyIwqYNofDOrvn4czau+jAxLS5gFV/KuPn2CpaCjrDG+PenNgsmV18pGm+D
 vZ2xIp4NhU0S3M8sITg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611080052

Enable PTP_QCOM_TSC as a module to support the Timestamp Counter (TSC)
synchronization functionality on Qualcomm Lemans, Monaco and QDU1000
platforms.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..9af55787b236 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -689,6 +689,7 @@ CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_APPLE=m
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PTP_QCOM_TSC=m
 CONFIG_PINCTRL_APPLE_GPIO=m
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y

-- 
2.34.1

