Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714125;
	b=Pc9Kbd2Q9iI+5GsYIYL/R4cUrkwrJieTQxExN28zsy0VYQ9KfEj3a/FlB87XlbR9T2Dd
	 PC9f/sLk/BlLA9r+pdQEekRGWJyfPnQHtUOHzzIRPhfYnO8vQwr3qi2S79Dhqpkfpkw94
	 2woz2u7xClALnG4WW9BIsgmiKhBn3mIeBi5XkMAYeWpxDgLRz9ftW0dLqd/FR977WbyNX
	 l4KAHvUVKdoUJ7cw8V6yNfceH/iDORyxxJvFJtcSOBKuL3nw2yPn9WdSa7l60IdoExh5E
	 PKVfAQIPyk2pVa9lOyycAYRSzzQ4nXZxXhHMZyXoV1uSVdb2yqRsTflll5s/vYxJWKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmiJFWyWNTk=;
	b=IQ6FtUXXZdlejx6cTl/3vYz4m6YsDQvDvKmDS1acnSaW0tWW3nkrkHnfaAmuvg9q97gM
	 gjQWQQrNI2TvT3HjiB46hXZEeDAGe4MWMGBq/avXsGioPqW/KGT4uibtAcwLgQpHh2jAy
	 1ug1Gom8RiOxFmqtQe+sU9nqzRG0iXCYzuuC/m/tCImuk6iJ7x2CDnQ670A/kXJt6Gy4c
	 EbKF7c83VKbgUGlnVXZU+uJN7K4y0NSeAbrj3HNREldjafA3AS34qKFcjAiCKf1WLMLs/
	 pbB5MWbzNsnu7A0vD1HH6Eo3lF6clZ0LZzwkR/bhjWqicrExHyfVvixgAmNSXQJmSVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6P8ZjL5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLrP5vbU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8294E606A328
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8294E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6P8ZjL5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLrP5vbU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZDoT3002333
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 13:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmi
	JFWyWNTk=; b=W6P8ZjL56dLuoHFh3Ml2rKdlVb36Cr4xSmlCm0HJIRQUAs5rS57
	rPBDXmZYnyru8FoLyxdivouQY2j+1qcw7VR6gjJ1dTu+H7L2iXICrRRKZFGrj4XA
	GgE3InhaNMDxq7MhetwA1e+wpuwgHK/SoFWDzO4nqq5iroU3TPv/s447eMBgVRn3
	ul1ZazQslK2cbUSgMb9A9zhivuPvjkCxvQqW/3aOL+8HkfhTqaY5BKYSNPQqjvuh
	U0VDkZLkzTxpQZ+uggn5Eh3WnhJwC/Uh4+jjbQ042LIPRtuf2zIxh2wKPcfqQhFQ
	J1hVpnoqx4CU+k33UYkhaYUsTPs/7jypmlw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq08740rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:55:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so3927327c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714122; x=1794318922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmiJFWyWNTk=;
        b=eLrP5vbUsIRkVG63I5BI6kp+XA+SCLu2tAsm8rKDy5vK+A8W9sUe88ROF5MxE+28Ny
         aHlnZ6oqX02YZHkY8NsPzvyZgky0eQLcSan7gJFlz5pW8mVg94CCRnz8vkJP+YhqMlqb
         G8IpYHjXz1Et5/FE2t0YttpAOF9z9a7a2bT8D+08rwYlLkiSWr0HJGVG7nD/0xeIXFWE
         53QvotbahxkGiDpM/D7mqUxfqRQkMa5eA4ydsfTKWGb54Xfaoika6ZzQLj0Ffe5xsvqD
         5jlQbAAFjGGrVv1ZqVRJhbS0iIsN+rM8/2b0A+sdCmmPudR07THJ4EheBVy7U1hHrW8J
         jV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714122; x=1794318922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmiJFWyWNTk=;
        b=IdG+BgSSm9kwstP1I647EqAt1wZ3ayCnsBwWyVZCj1GEoyzHNgQMFOuyWGg375iKTO
         Hvv6x3TC4wl99NIQRaQKO8qOPRQHbw7fa8FGV3dJNpJEc/M3vShrn/Cn48CKSzCA1aif
         TNEXRCbwIE/5I+6fAE9LlyW6ROYKSyBnv10EVuW9ufXOawpXhpEUkZ+C0KdH3aSvXvXS
         jO5o7jacfgnFazReIX8D4yxJ2GDqpS49sphQ4ujiQPy3JG1di+VpBiC7528iK3Q0hqmw
         XJ4ku1ZdRIbOr87T9fbrbXR8BD1eoBH1G7LG+5BnGK+iowRbScfEUDjRvgIKMwSPaawf
         BTnA==
X-Forwarded-Encrypted: i=1; AKwUvBznSu/5PEuGJTy+1gnojnNQTXdsW7RA4giydYB0+7s/vKCAMCyxDcEo29KlyhZTJK+kzB5XV3cyurJDkrBv@vger.kernel.org
X-Gm-Message-State: APuU4Z+FYEJH2xYjyqWDE0TdnIHXoQXQvKXgcSFTcgSXZPvFaABxia4+
	b8MjYqT9bH3cWIRgEGB+ztvYMesfdtgPyvfd2j7W25r5bYNq9A2qs0msxMGUUmWPjnQsXm/UhYI
	NaeJJsWXPcwixKKnxXON/B+1mvnELqrVAcVlun1NJKAnQZligCHDRmQA780y//5xRjWIA
X-Gm-Gg: AYBFou0XsyGRHBUvbgiRXREm0gQNhnesG/O0hEvk2Hl71qGeMRD1uLqlpfvdW6cuvmw
	Do6VjWfG98d6eDoidgSkE5w1yLIvW8AaAk0GWjpzDHFJ56syjz+raf337tsASWppyx1hb4GFibe
	AY/50Vh4qZb4BaDT+x5t6MGaMtoNfHhoPj87uvgqPIml3jCLTNK0tH7TDUnptmHbtcUdRQD/mpd
	DDoIhdwyNTmUaJcW6DPjyg4RzhPK+MvbY6j7044z5/B1JPM/XvOQ46FrdS6vwowSqbu3qTVTLCk
	lVybrxX8CZH5y0ik+X3kZS4OT5l6w2+gzEdrcKJWr0m4vM9auQ+yCVATJw4jDr8SoZmIJIsXLPh
	/dYi9XG3osmK12vJd7iUW2/qgJeFstzddWLgOqojpy+DE7OP82QA6wy3gx4kioThgSZYnN4gwQX
	Qb+6cvf/ICTFaNYZSe0N1zJdR6DLglY+jq
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr20880092c88.34.1793714122241;
        Tue, 03 Nov 2026 05:55:22 -0800 (PST)
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr20880034c88.34.1793714121441;
        Tue, 03 Nov 2026 05:55:21 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm41634001c88.19.2026.11.03.05.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:55:21 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/2] arm64: dts: qcom: nord: Add ADC-TM thermistor channels
Date: Tue,  3 Nov 2026 21:54:43 +0800
Message-ID: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX0GOcsRS7GLd/
 cY7dNdCu5sADMAG8M5NJaZh2uDlfzhHwmLD3RMIMB6mSsPhZhAtZU6Qm6454u0bwptLBYfK0Mb0
 tPkZRZ9kyFYvJMPzm8HioAEAK03n24s=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9e7cb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-jktPZProMVJZdFyxj4A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXxNCUjyhSQ+My
 KhBu5UDrp4zJSoe9ixYEFhCwGPf5+IwWOh0IMtWHPXTuwcsw5IRmgqS5rf/JzOLPgh/1GGs4IID
 xKM+hkv+dCiTxxc/uygzJlMaLoJiA8ubP7utGb/mzU8aiAIFcsgCmFBfzMJMI2z9uGHwO30hXVM
 h56Ur9ntiFsGskrQREHMsspa/fUMoVPb4uceoPtMrTxDJUqExe19OqflqYzDuNxndOClZJfOfUZ
 gvo06fge5WHxa0AvSzd6powNg93jaX8FdaapeNWD2mkV//PVErKLD4skGg2E6EXb/4j3azpMi65
 bUJeyw+rTcbOoAidosy9iL25pQnPlLcPO4e8dZXbDws5fYADtgbvbak/qaUd2P8tHpCDzqJ4kPi
 ZOUSEYqYMLarsFmjJVAbvdbOnN4pIpzkztJS2WwH8qIv6xQjoqDN1nOaLKURPxqJ5q6fubTrpSA
 +qyt2w6sjuQfm4myvVw==
X-Proofpoint-ORIG-GUID: zKWprnRW64slP_VJN2b_iutPbxrPoNpf
X-Proofpoint-GUID: zKWprnRW64slP_VJN2b_iutPbxrPoNpf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030055

Add the three board thermistors wired to PMAU0102 (Kai_MV) AMUX pins on
Nord Ride and RRD: SDRAM3 (Kai E AMUX1), SDRAM1 (Kai I AMUX1)
and UFS (Kai I AMUX2).

Dependencies:
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Move thermistor channels and thermal zones from pmau0102-nord.dtsi
  to board DTS
- Keep #thermal-sensor-cells in pmau0102-nord.dtsi and set it for
  all Kai ADC instances
- Rename thermal zones to sdram3/sdram1/ufs-thermal
- Link to v1: https://lore.kernel.org/all/20261028150103.520428-1-shengchao.guo@oss.qualcomm.com

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord-ride-embedded: Add PMIC ADC thermistor channels

Shawn Guo (1):
  arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels

 .../boot/dts/qcom/nord-ride-embedded.dts      | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   |  8 ++
 3 files changed, 176 insertions(+)

-- 
2.43.0

