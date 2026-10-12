Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8B442FB3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796629; cv=none; b=K/bJX5nCOr6MrGLRE1DvCSzFjh+/FRztDagXoX1wOXcJ/ZRmjVEaoYTlTT7/OVo64YVOUiKI0cqaDMV008GTRI2E5g1cyYg1gTNXayjcanZ7s9wZ05IlgqvyffjKJ72ISNO7jH/4yIcqbzBZtiCCixUpHGMUSm0eQ10q6irizQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796629; c=relaxed/simple;
	bh=t83sVHr1wKC8+yaysLXcM55WsgLGm+kgVdHDdB97PJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wo36vS4r+kpSZG1b3JrsW9hAMrxgk0ZjBPqdsqjDT9Th+z3goZpHKBnZnpReZUZke53rzxDL0PyEzR/e8QVooSxsz8V5qWrNYmn3aV1UxlTn+QUapf/Hym/7lyxbkwgOyCT5vWDo4ajZzI1d3n4jkBRqF5cxa1IcdGEPDWOfH/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DH5c6w4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrCBldPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DH5c6w4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrCBldPU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KfOP2874311
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N4944zQT/7NakQKX3eNjFeImAH/Tf+C6mWE
	Yc1Zq7AA=; b=DH5c6w4sJGJd+usdrXWoAopgMpDPt48JcrcySH1Mr8CwnGQE/Ao
	tE4m+pYCdifB3XdkK3EYCXmUaYQtm1aQemBj+qnq+5Y1gbzPhr870n+FsFcJjx+c
	tzMq0M1l/qftz9W5bDOGSzXO34Cc16m7hpgGGW2XXXqQpNNDQA6I8UOL4E08dQ4f
	GL/85QPUaFNget3Wg4gMnHEEEIpvbASr0wBo/fvBAmg98/BfKibrslS4xZNRO8CV
	IZvn7x81UQadSFS4WD71ioPsOvmj7S8Boyx0Agn9nPMo4VgqTAVK6haDZKdJqMjM
	dXDc7yqHHswI5+WOeHHsErBxVNGmgZzFRLw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fe5ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:17:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so2375565c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796626; x=1792401426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4944zQT/7NakQKX3eNjFeImAH/Tf+C6mWEYc1Zq7AA=;
        b=OrCBldPU7q6kpd9LuwectKsnVji/7Jt8qYSWwShKdTSy4Zfn/BJxJ1pbNcbCwv3uQ7
         1z/0wcEfgEX24VGswyTEOhMyHO+OXTgzXW0TfYE7WZpOnTuS66ydBOhbNcKyv12EzOkt
         p3pncEvg8on1+zvQneYN6bI/UvQdPaIeRsOINWtpAtJQJ3ahfgIRm+xOqfJKtSLAbCOu
         Nm+mHrh3BWOZqrl7JpQlqcARi6H3vhqKEBqfukU/GicnVqZ0XgtcP2dVT+vZkGz4cfEL
         XAu0gewvt1mXooilO61Tf98GaYFjsGbq7phWPvhpSZDGOM/tNTn2kZy6i3PAKmsBDuQw
         bavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796626; x=1792401426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4944zQT/7NakQKX3eNjFeImAH/Tf+C6mWEYc1Zq7AA=;
        b=VnKwNwaaeaq0tJGiq6cdCz5Bq1+aDFmqCNbesUcyhUB/WrqMJ6oLwM57UWU6jHcXtD
         iDDjNEmNwnirR98uvN5x2fVvm6aBOXjUuU7a2WYLBiaDEd5Oi5g7qr7eF/xz/UdS3KkN
         kEvCu3EF6EKQW6d+3db9KbgukL/K4kOuteafBkXLX2C8II5YdEg003pXEWHlYgf6dvHI
         Ry9WTOW8fVkL2wXBdxk5DNDfxDSXGUyA0HPEycKOVxzEhGtjhqL7MFm76tOBhJzLZRYo
         LjgsXQPEPTPFua3fZM7s7JxUfUPfrRE4AvIF/or4imFJrgUuHDWeqzvHyKujJrbujKZk
         /dvA==
X-Forwarded-Encrypted: i=1; AKwUvBzbJRNhEB6hE/e/zHSyEQmcqenKJIGPLbtCSresp/CA6kl48sIuYS9AqwqrF0nvdbEE/oU0e7Xwn4r0eFL4@vger.kernel.org
X-Gm-Message-State: AFq9FYLrflapfg7y0mMeAmY2jKEa1JQgXSf8bEXMV1T5U5M0RQKcHLad
	3/cB5+cQ8iX1KZ2aHp2zncWIoThgZs8ITeCKxWPoHctKlEzr7KOeJjAztylefjbq3eGvI6BlsOF
	CSOYhg3QkxrOf8NXE9+Vp0IMr83OY6ZX3IYf5jKrQtw48CSXJNsUuBF0nuscXfLWG7DTu
X-Gm-Gg: AYBFou2Fwb1AWIQnU+AQx+/mu2oJrqFxogrA10MycCnseNCzLd0NtX8iL8S+JHD+WdL
	5N2fCL1HubvKDw3PMF21z8S9beqPbOXJL9u4Dtg5R5eC4NiOU7+ZMLDN9D/uof3Bv584qV1LU/M
	ku6LAAm4DgTTF1s0j5Q/y7VUGIJwrbU2tD3/PR2cIdSD2n/VMkp7OOYKSyjT1jmJdRRFrHz9Rps
	NCqhdSi7RIyUYcpWoAbCxxmppLb0kPCS6mk7qMNeWLfUa0R4+1FK4qn6Luau0EkaV9xs02VCmXN
	pkru6Yua0wjWqj01QuW3vseFmjuIsczsDeP/kNhAdDSjHXmRrgCBQDgt3GlncucGJeXhi8TI8CJ
	6tdOcqL36WGBQj2+6dQOGFQ7o8t+0
X-Received: by 2002:a05:7022:296:20b0:159:aa67:2893 with SMTP id a92af1059eb24-16a5d642d08mr11145406c88.30.1791796626333;
        Mon, 12 Oct 2026 02:17:06 -0700 (PDT)
X-Received: by 2002:a05:7022:296:20b0:159:aa67:2893 with SMTP id a92af1059eb24-16a5d642d08mr11145386c88.30.1791796625710;
        Mon, 12 Oct 2026 02:17:05 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm34502575c88.16.2026.10.12.02.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:17:04 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] usb: typec: ucsi_ccg: Add CYPD6129/CYPD6229 support
Date: Mon, 12 Oct 2026 14:46:56 +0530
Message-ID: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX/ox4DZY+/t+o
 /e3QEkpN4fFiv292EKDIRP9ufwBfiAFumHGBu9zw4ofQ5e8v/BGFRvMdQbtxYC1kRoodpd4SjCj
 JqOWyeFDvvxv7yM8Emzp6suW9Vzs9c4=
X-Proofpoint-GUID: vyHe12gW8CPpUGP2rsMwGHaNpleoGvTn
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acca593 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PrD5CQMRHxEyf_1mFesA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX+G1hllFrbIcR
 MjANaxRPxRpk496d4L80gAaOZUQdr9/U1CgYvgivH6ECz2KowfvwvYBpq8I1kq4zKM7gNSBgwVO
 FhTA2E9DDczsK1FgKjGJqrotuUfLPkCgAUescfv4QPMLeZkhu98bO5muV+QUCaZjsNjmB8e8/RJ
 wsjt308xp4vDl4qxofXUub9wDmZkTceYmPzUhPMzZCzmNtfku/r0HR+D8gcuh1vzLTWZTVuqBcX
 aA0jVEQUjMFbX1PlQXSq9GLZ+ni2Ix3jUyyQBE/JitctgW7RX8N4thfu/ZB/qRO671MW4DokDXR
 DtmvinPc2KDIagYmWaZFJ1VVnBzPo3DPMVUtkls/0dKyDAMQmpunV2hn5nNCxh//LgDNTGItlh9
 HyjMBwNIWlT2b9r8vNZydtMXI2dymYx2kozfi/cS5j2x59qzinQxpSj/IbV97EADCunOHhyAo4C
 JDm/tXXV2ngfj1mkh9g==
X-Proofpoint-ORIG-GUID: vyHe12gW8CPpUGP2rsMwGHaNpleoGvTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036

This series adds Device Tree and driver support for the Cypress CYPD6129
and CYPD6229 dual Type-C PD controllers.

The controllers use the existing I2C-based UCSI CCG interface. The series
updates the binding to describe the new compatibles and controller-specific
properties, and extends the UCSI CCG OF match table accordingly.

Patch 1 updates the Device Tree binding to:
- Add CYPD6129 and CYPD6229 compatible strings.
- Support the CYPD6229 fallback-compatible relationship with CYPD6129.
- Allow controller-specific I2C addresses and interrupt configurations.
- Add pinctrl and wakeup-source properties.
- Preserve the existing CYPD4226-specific constraints.

Patch 2 adds CYPD6129 and CYPD6229 to the UCSI CCG OF device ID table.

Changes in v3:
- Fold the new controller descriptions into the existing
  cypress,cypd4226.yaml binding.
- Drop the standalone cypress,cypd6129.yaml binding file.
- Drop the Shikra DTS changes from this series.
- Add conditional binding constraints for CYPD4226 and CYPD6129/CYPD6229.
- Address review comments from the v1 submission.

Link to v2: Link: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/


Akash Kumar (2):
  dt-bindings: usb: cypress,cypd4226: Add cypd6129/cypd6229 support
  usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF device IDs

 .../bindings/usb/cypress,cypd4226.yaml        | 90 +++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi_ccg.c             |  2 +
 2 files changed, 85 insertions(+), 7 deletions(-)

-- 
2.43.0

