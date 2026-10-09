Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF94DEC0D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551634; cv=none; b=D2HR3kUGqwqkoAYon79EtMiouRvvb5k3ttq0y0cz/iYTDWewzzEQ9gcGAaM4dVRARQOpQMvux+bfUueF132LBu48EwSoaxawf0750kPa8A1VAPBnWQTMqKkSs8COfE9rWtA7+lYjmaubDmgwZ/109X2ztMzaoKK60/bOWtLEf4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551634; c=relaxed/simple;
	bh=NarMphwKJZWkeVrjUE2NXGS04Cgen9YQEU6D88mCGUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFdWTXHl+mKbMiK7FHEW9QvmBiP5fNBrap7WRHAki4UcQMiYqjnn04aCI50JRS0Q5Httq1ktn3O193IcEwmSiMHCwLWJwKEiTmGC7YxuO2vYcWvpHwRbhtjK1r4YoLnv/3esQ8g8GxbZsw+Ph0y40U1hrluoMKT5KyPxSpzw9SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3b05VVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHBZvfOv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3b05VVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHBZvfOv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIwU1625955
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 13:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKBZJnXgmeKva9tYHEU3hlo2mDLwoeHX/ZQBXzGxQxw=; b=h3b05VVAmzCVlbIi
	rQjDVb96YLJ8WBlsDa+LV4G8M6aF9KvtZUwgHrmY4FTU5483dIkZr0SrvBzBHn5L
	vTssQ7isLZts7TRaPiFOrjcFmtACUVZHsRnqo290/cT8vCVcYP7tNwRVC0BsuTUK
	t6xB3PbljoFMOu/2AG5KQI11gqrlWew75h3geHyXEqEe21bBwDjbxqGVJFlParO2
	Z8aMspc7POLXT+avMn2kG7toIlGZfXJ+GyUkgojAYczsy6qoGYfE2/JTmmkZPMSD
	X8B7JvRpw1OIq4rWwDnl3ziov0BIQX+YiVl78w9Kacsds+0ibpWDsxLJNGqPg1O1
	P6svQw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj3nr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 13:13:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88cd731cf24so4853279b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551631; x=1792156431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKBZJnXgmeKva9tYHEU3hlo2mDLwoeHX/ZQBXzGxQxw=;
        b=dHBZvfOvGvei1YtUiWUD6uB19ydvCWFeEeYHI+QIOzWNYBGDSRMVMs+Sbu5ztStcyT
         RPxwYriNoKcxalrrhVGCpI3fmu5t+sTnQcj8smM0GTaj9q/9aaP3fM553xMjM7UJNWDZ
         06Ih8e/lwQCMbbgNRl8C9jay982XVAZzimcRZ2qB9skQxp4c7rCin4TbINy48rn2+0jl
         7ox0gAQAE73lli+ymB8TUTVtzwjTACKlrBfBtkW2hh9ksbmDXgT8ZLrfz+N/XieavaCy
         Telg4woByrMZVfVm1cpO3i3XSNC3+fLiGpAxV+axhvoZUdwIsGiDyMJn4xSreZaOfG7c
         DaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551631; x=1792156431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKBZJnXgmeKva9tYHEU3hlo2mDLwoeHX/ZQBXzGxQxw=;
        b=eA7bzZ0+Yl5PcpjZbMbfTNSYQ2fg2inq6p8mqvKNcnixqxUpD43GZjed24mzjGF61k
         UTajrFqpHGaVvCbsMet0LijnAw+2cv5Ews0W7KWEx0cbAPP37oqot0kHliI82VJw3+bC
         KYw9+NEW9t0vs5s14Yo6n4/YCFahlB9yK2hCly2Ue2Sl3LF/xarmsOvnOHz0fSV5e6yU
         tMhp0S5UUODa+nvWQchEAlhBcBbFYH5wezflfIu1KSCRmKzVPdw6ojSSMV6wM05p/JoX
         881dzsSkbKrfsLRqGhTfAE1kLl4qMjHB/qCVUPOM0DtJAgxOdl5CgOLhEh2xv+8HDSoa
         qvtg==
X-Forwarded-Encrypted: i=1; AKwUvBxpq8yM14SDCaiyhtjbltwqd7gh5aMZZQIIODRXd1OSUaolR4U2u/v9TSlzbmpIVC3PwmeJxWnAk0qIJ0cn@vger.kernel.org
X-Gm-Message-State: AFuF++nfncxYuVGxpk/bNjRiKatsGYgus60j+ZpfXmNvlkqv+yxZbBnh
	BnJ1+yLSfJ3q9BQE1J2a+FcIGNfO9j11OwqLv4pLT+MAAG7q6Pe4J2gftsKfzLIo7sekvIMoYTU
	P4vKMKh78jA7rhsGSrb+ImStJsqEUKdZPkGg0ihzEeNA38oqQIzDnYraTesfLNG+72Evt
X-Gm-Gg: AYBFou0p5LzoizLrFobAyWr6ggXiyfj4b8sJpYbXcPpaWebpHMNXnKkIAcnnjDL3ucn
	gbXPfOr/K78w/8h9ctRCsfVejskwEypTVb0YVqm2xfEX40MUNua2vfVwHbjqGQ+ylI14jmTnbg6
	crmFG7OAXL4zyk9E1IpCahQPPG2INbAirDYLe/c0wWsWPNSZt0qdwE+2UQqo8kQo7eBfWo0j4vL
	emrzUTj4cAqXxC2NmKolK7K7pRYrGV8jS8fWaRZtB6/tIHJ75Tw2AJ0hKphZI3kCOZFK+K2Cyde
	sk4RENxe6KwMElCY/0mgpSkTynlt/WT1JxKPauMReWcRN/sRYWpJZTrxHI4NqSkMwGXXTfhyP5w
	VqOEsRN+0t4MR4VKXHL3gORBYFEx0f4Jl4PB+
X-Received: by 2002:a05:6a00:1c89:b0:891:6721:370a with SMTP id d2e1a72fcca58-897c634d4c3mr1381616b3a.29.1791551630997;
        Fri, 09 Oct 2026 06:13:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c89:b0:891:6721:370a with SMTP id d2e1a72fcca58-897c634d4c3mr1381596b3a.29.1791551630549;
        Fri, 09 Oct 2026 06:13:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 18:42:52 +0530
Subject: [PATCH v3 6/7] ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-6-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=1004;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=NarMphwKJZWkeVrjUE2NXGS04Cgen9YQEU6D88mCGUc=;
 b=Kae51AgYtFhP6GXyOV87zMR0Df5elNwkzvmdCO3SW3HnOsa1dYCHWLcl4xj2mF3nLnUB+GKxq
 2428n5ZfYbVDxFyMXHxlqKFiQD5PLUqHHPmZuYvAXJf2VB80+lfxl/R
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8e890 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7YRCYCP2VF9Zukq8dE4A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: m-W8dkcihHSBPq1VwSzXcIzjlb5x1HOm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX0qJb4e6/gXJH
 E6CeZEZXmEx0l66ctZ/jiGrt5qEINMYFSCj7U6CsktX/H+qZV6r8CSZHrK577gQ9cIL1aRm/sDs
 VrHtcUjuzmBRbhvPB9aEHDl43+C/VY7Fb3OIz4Zf4QeimfE4hsdh0NXJzrRtMI49MgX951Ig05y
 AsRheqQlNa8tYswHnXHiprvyZgabeMvLKNbupwGaku6GA9+RQ+CyCTW60Kh1OYaihlQGmyuyBxu
 QivHjb9H2aYtgSOtYz9TVZ7GnV2cCuQl3ptsBxcFza6S+L+w/vCLEk+wvuTChXBHrEPd7+TzZLJ
 /gakLLa5zRVTnKh3K7Xl1LiCDIDoQC0TIPYPo9pgtcmCWjEH5W1l4VbToccVdabrfKRP2A8+uTw
 jnnaqfu2Q7JJtG3XRoW2hfZEj0zMf3yGr1bHDZQvyQVZXzfI7Tq5dvnw3h/XrRRJ6ed4B8VDRvd
 AYqqSXtTnZkydlf3Lfg==
X-Proofpoint-GUID: m-W8dkcihHSBPq1VwSzXcIzjlb5x1HOm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX+hb7Sz48cqj0
 e34Or0iNodMKBu4hjVOzFfDW4xAK0sm0Sc6TcPddLaDlD5PW3c92U+D1QDAycQzUWZvaC03zqKG
 rLmlvRKBYcHd09XffMVLc3BLP2igjK8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090052

Document the bindings for the Qualcomm Nord sound card.

The bindings are the same as for other newer Qualcomm ADSP
sound cards, thus keep them in existing qcom,sm8250.yaml file.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index fc7bccdac..372919ff9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -38,6 +38,7 @@ properties:
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
+          - qcom,nord-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.34.1

