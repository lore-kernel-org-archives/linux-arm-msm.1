Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431CE2F1FD7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138394; cv=none; b=NjCSWbBm83A7rR+phw+5fNSuTv3JPoL/rmrnbrGFcaUoWcibpeR7a9Y4RoxGQq2ti4a55mr/M6Ri7D496C1lXt6wkDDvXjXmAOyzYjHoXQLlibLjlL8FTgIUoUeNOZ9YU1UdgwO1AtHqmBsr16ztsaN2/mP/RHfiRxKB/NUrhYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138394; c=relaxed/simple;
	bh=MB1vtXUMCpkuRXEQiZFl5phzdKm+C9dUzeZxDQlSm4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zeb+V8BrtDJQwePrcYNIbccQtzFGIbrkIy0IBWwnVBB7H8Hb4UoIOq8ZRwgsQFQEtyrFteQ6tK0YFNYidNSZPUxIP5LEpLL4H8MKbDWSpzWYsZsBJJJXMkXB6fJIdi9eWdzRxQPdiEqxcTUBfqRVdgK49ABCWCBwBfz76ofICGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFfTClyx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O70R5tTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFfTClyx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O70R5tTR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7Raac4161906
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BtGD22oI3MovO7kq2g7OAaPTIehTDeS/Sua
	xgitg4C4=; b=BFfTClyxbaVOq+Nwq0xCo5LLkasnefwIzwryXfJVqScxbTYbNEG
	ZwZsw5oSTzC7Tx1yVIsi+pB08VnosZ1OfFfE1v9EY2Bm6TyqjvMYa9LWlohPaXST
	1iPatRc+iJhhGT8MIaqG2BngK7FJoAJ+0YXiTV1oQq+LsotO9dqcQ6exsCRcS0ty
	RelEnJHHG6kGJ5S7JH11hJEBfeYbIuBJ3b71hEw8ix/zsXAb0meIJJAENIom7xXs
	icS3EGrxz/GxvvG7V2HzLLIq3u637PhDrFu8ca4o9A/NlC9EYyWCJLeqcpPvBRJ6
	cAcSVW28WYNG69NkD8wkL4NY5AE1B6H6X/w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wgs4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:46:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a67b16217so4245889b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138392; x=1785743192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtGD22oI3MovO7kq2g7OAaPTIehTDeS/Suaxgitg4C4=;
        b=O70R5tTRZc7/PR9vS2ULtadyMX/NvfE69cRi+3V6w962UWfqVMAZAeAKZl/nsQL87S
         IBG0/JWEQHGNEkta+pCYlppTDKkI0WQz+xin1VEs/JJzdv9udJfk3Ft+Z2ac9CfL/MVg
         q7E/WZB64FzMNGM1WlpIbVc41TLpTNmW8F9dDuz/wXYdqmxQ/JjqM2/PjjZ96Ikh+1vW
         vRU/Yq8bnI0TUxwwF23XZYyXi7dlFUU7sITb5BIMZcMbFWRque4RVAfVrlKhG+PD8q8l
         ggB8shUjECJaBtTSkAuuBUOtVdHz4t9XPjcPOjN34BWhjpVT6B/967iUQpIdPcYWP0hS
         gHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138392; x=1785743192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtGD22oI3MovO7kq2g7OAaPTIehTDeS/Suaxgitg4C4=;
        b=aIrjtzuTE1AziE4pH/vHL9G7ONQAok3OP91vSS0PbZwCm4KeYmEeiw4izX0S9q4uph
         gvES1PLdixRddCfj4XwMS0CytIX8+lgEhfdhuP20Y5e6Nl+OPLlE6mxqHFKmODk+p4fj
         X1gIr464nZ42v6LjUZKHFg440L+Djrhsbzz3kkmEJw2qxqe6am8vewiuaLkvcrr0XsNG
         6Aook+KffZ2QnlBBOm/ucfJAJ8ekpCwW+4FtXBxV6nJUjCWNTFnnZeBjxgc4JsSKOcuk
         mQ4n+Q3Mc9uJu1BQfyL+FVCsXIckrIHkJvEEOaPoWg/bU5RHOr0Xtjv607Q8HX/fjJbQ
         MlNg==
X-Forwarded-Encrypted: i=1; AHgh+RphLWeR69K6wbK0GnVgGTTKNQe0rW9oZA9JzcJJbd4ILBDDXj8QHjOMlZbZBcXEBazszcibN3gr9321gMSD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Ekw08n8J6MrFBCbYAY+rc8Jb+PD0n6f0By8A0GECKPVCnvoB
	nczxFr0DlzSmW9U/kq306zWFSDHxLUDTNjSjjelQYDkXuDQO4i65PtyPRwCBCMFh52M+UcEWba7
	PfpCQd/57WYBDOyxCa0DXAHWRyxaK8vnq+XuOdzCC4Pnh7FUp7DyX7dgsB5oY+V04kf9a
X-Gm-Gg: AR+sD10fhiNaGv5iK0j6hM/znHRJss7nNp3gtJJOFsfb3KqNvB8peCb6mPxHK+5ops5
	OWrqUR3VjNYaAUYFw3BqZ1Txq8Hy7t9pPwZEA/phvsP5fwlmSnjZdNaiYxbjUaxdYavBqOqyQOZ
	FcpRn1CWRRcD/OZbdi1zsU+6HOaPh08nYenLbwCUYOx70NCYD9Xi4nTMD3J7JRaVZ2MqJHxJSht
	UykYzTukumkk8Q2AP7gv2wUMQ2yCuQqbPEqDaitkoT9vlnfUCHLgkR71jRB1i8ArFOWTY5fVXPv
	R8eMEHrX1nb1yhzKKasS+hN3WuEd1VRV9J4919x542NjsZb0LD6qZgBVt2xkUmNFjt8NOMPyrEQ
	hmFIZ/OM+bvc7bk9x5vR/4I1YEHSHkUrsqZgj89B9IZ+zR5LGYpsdxNi3AO8E
X-Received: by 2002:a05:6a00:4218:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84e5942c19emr6252422b3a.16.1785138391859;
        Mon, 27 Jul 2026 00:46:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:4218:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84e5942c19emr6252397b3a.16.1785138391394;
        Mon, 27 Jul 2026 00:46:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2590150b3a.47.2026.07.27.00.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:46:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add ADSP and CDSP support for Nord SoC
Date: Mon, 27 Jul 2026 15:46:18 +0800
Message-ID: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NSBTYWx0ZWRfX93DP8HijG9WU
 HlgHHHUlHbgLqhXWAlolkQ+aZFcbDbzF+9QPg6FwCnEGmxWy9LHyLPZ54TYQLVYtzuFcoeuwxWD
 KYUKpbyaTZIgALlQWF/js+nmFul/Y21EYxDP1lJxoZDJtaODUfpRcyANQ0OjCU9Hd6u/yWVcVWU
 OJ3TdJVwH1boI9rXklK8fMeQtF85yFrihMZDyehXZCpc+/Ls02wTElq6MhbI1C2+RVZEh2EUhd2
 4I3daVLRjXPO+8+XQRTRnPHFkrHcIeNmhPFLgbd26s4g2/qZnAQQ/e/90FNpWlYXJESKTRrNMmt
 pSSSy6i2zGw7i1Rvg0h9EB6hQkxjyiYLzMU3FYHDJLz/n2jMIRsb94kK56fqflPfVzEyoEHWhAb
 +1Po8nFWKx4uGCCvo5R5TQTIsUTInc/Bec36p2Oxsn4AgsNp2P0YWCuWgwzR969YY6uridEfC6l
 hp/8GW3aLYFU4kCHtSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NSBTYWx0ZWRfX3EpRZBrgLWOF
 qOCz/DvTFrByv+I5REe9LtVBzGPRr/VxknDxvwRAxjJ7RU8WqnpAIyV06sAOJoqncKCnjMjx2Rl
 0diFmn2pCdJ3pX/KiKJbBiSP9sBpePY=
X-Proofpoint-ORIG-GUID: xNe3o0JtJx2xQwGp27htIrjm4Zw1dIwD
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a670cd8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YTZeY_j4NDz4IKi_2jwA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: xNe3o0JtJx2xQwGp27htIrjm4Zw1dIwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270075

The series documents AOSS side channel, adds ADSP (HPASS DSP) and
4 CDSPs support for Nord SoC.

Nord SoC actually have 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Changes for v3:
- Fix qcom,nord-pas bindings to define "minItems: 3" for CDSPs with
  an else clause
- Link to v2: https://lore.kernel.org/all/20260724103848.233804-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Create a new qcom,nord-pas.yaml to cover Nord ADSP and CDSP
- Include CDSPs support into the series
- Link to v1: https://lore.kernel.org/all/20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com/


Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
  remoteproc: qcom: pas: Add Nord ADSP and CDSP support

 .../bindings/remoteproc/qcom,nord-pas.yaml    | 173 ++++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 110 +++++++++++
 3 files changed, 284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

-- 
2.43.0

