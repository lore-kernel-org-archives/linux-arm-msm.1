Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EE44F96D9
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738322; cv=none; b=EsB4AF6++AKc1wzcGH0ToduyGBl3mMyKSGaP0k/D4mNUxzIkHTFnRuutxerSwfc1SmZBzI7fHZtRr7tn/o0K/GoRZ08cdLpKRLBbHP+1UVs/2zrDiAmTFUMonCM5xj2p84Ncp/TmHh/NIeFbw95+nkY/bgsC3HSzXH9tuklsUOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738322; c=relaxed/simple;
	bh=qnVsk++1S0X0GRg3DxqeDr6O7Yc+8TFQ9tDUsCjeKJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4Oc+hLOE18gdQ3SnpdLMkmtO9miphbMBAq9gMuynD6SWHen+Aw+7uxX4jGz3VOWSlYo5l1eaUJMDejuTv3DvMYB4Az/GFBjMn1ITv13nSz7u/J8ctcrXZC4RIGzkbvceDYI0vs//tXHjsoGXBPJbaC7d/ZBjfiHSZV7TF1g0Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gg+7XDb5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUMJBGDt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gg+7XDb5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUMJBGDt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOW1q215597
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCTnLTcxwzZ519pMEGEz0Wjn4bFf75SPdZzoYKRnA60=; b=Gg+7XDb5Xspqh047
	dR82E4z6pFEdT/IzkzvWVNUnubpVxeuDQVNDICK8edyk1wYeEgDWPKkdnj/IIhzw
	SkzMcEm7f/zdz2lo2REwKtU5vOQc353ocbTRKjGm42/qdcqHahGt50N3Xq94LRvz
	e/3qR3FkrL8D5miWDGXK1fXrqQmw9LG3rVGZhl6pmp0+hc8VTWMle02WBLkBDHRF
	XHam/bui5hE5I1Sy2WwNoCohBYFR6orrPSrFXk8i6+kxCTPSivGUt3iONFP0iay9
	1HKLP4kAqKXwFHuAPZgxuBhBvTnW2xweOBD4p2JSyvboaogv6BmpPdCnvz+LM7Oy
	s1Xi5A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdubv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:31:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a43fc3527so2538452b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789738316; x=1790343116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCTnLTcxwzZ519pMEGEz0Wjn4bFf75SPdZzoYKRnA60=;
        b=MUMJBGDt9VzN4RgJIItlA4CX1uNCSQqnsPNmdTGvDYyRiLBtjcQvPWbNree3DBjm3g
         6XlzckhWVoyppLM8LdMVwfkEM9oVYPiVpujuijAAFAksot84CgHiWk6eI8BoIfNdbfkt
         isqPXUEEi1AroNO8Zzy4hc0cFrlsSbxmnTh/iH9BoV4+/NjC/KxFSWU615vhhWEXw4pU
         nZ3Wn5nBnawG+EP11ckDKA8dm0vuC5Ngq85nHwW0J/JMRx3yYp/qgzqsIgxDo2ZypfSQ
         AY5FmeBODZHv+ZOWfH1ZR9h8zLXRlKRsvO3hQuHqzqAqaqPHk1USlKnQWk6g+Ig/LvbH
         iSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738316; x=1790343116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCTnLTcxwzZ519pMEGEz0Wjn4bFf75SPdZzoYKRnA60=;
        b=gLF+aYyYP7d/SQmP6DqRBRI2WH+VR7GVpqXCbXbLhp5VToyZQrdULuL6AkGavEh7Af
         bulUU082Km+kMFqTp5FlQmL/Lb7FThxoiaLpFKVNQzdf5CevaZfCiSlPy6mqVNIlrvet
         pgvdh8ezyyrDt5BpsH9oq1K+s9WFFXmb9MAPUqsX7l8uAnWPYwj2ZcBRuRqXlFU7sfX9
         pLcaw0nMGDwaA7RMm421nPpWg+qR+WtbeBfc0p4Sy0KmyO+86Ecq+1mOOuwpyx6DLU/M
         Gqqro5usDYI5zNMfGxEG52JdfvGslsYNH9GnodkQzlxn62UUYdeleLPpZVXusrNCiSrZ
         aVMg==
X-Gm-Message-State: AFuF++nhwjQmzdQOxb2PEwZzWUJRB3XMN8KUGx5Nn2mqAEmlRbOgEjGt
	95G/OIZmPb9xwdcA0FdsjbnN+6hnf4MBZkyVboFFRWKGGV0naF6TT3CJZBZ/nVID9WhsrPwcy+n
	c8FmElrGmU5tfkJNmGWOnoyKtUj8FKQUBiIiLhxbhh7NMWpDuypgkrDGyub4G4gh2Zl8/
X-Gm-Gg: AYBFou3cIHjmR40MYPzWwK/sLoZpoEPsx6g/84seqfoLCT2Z5X+uWocrKUWNzpT4Xu2
	0xXttSqG7uBTbjSVEojo+uh74vNVq1PYK4MuJ1KqU3ywLdUhvYoRcUhIW81qp0K1KOxdYvvWnQC
	boZjKGLZGzYOmnkp8M+yL5l6jq29GhrTeMmCABHXIaPeR8SizUkT5eFpaHOqVQeq6/P/gT8vVAP
	PE2w+Epm7bA1pExXzn0FFguUmaW5kvxA0zAqSTh+kAJNJAKbkrZ7M9+ws5vZHzG6FAYta1K6weM
	yPl2+eXx+Yy4VG0+DfOO2ZpBpgDWzqYI2OYamKDphQ59h5y1oN7aGzW0IrWb6kJTi2CU1Q4UwZR
	NoIrZIRmEFXBerXIhDDEi6neD0EVEC9w61JI=
X-Received: by 2002:a05:6a00:7702:b0:874:72b6:7da5 with SMTP id d2e1a72fcca58-87472b68141mr4605351b3a.32.1789738315456;
        Fri, 18 Sep 2026 06:31:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:7702:b0:874:72b6:7da5 with SMTP id d2e1a72fcca58-87472b68141mr4605289b3a.32.1789738314774;
        Fri, 18 Sep 2026 06:31:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8f8b00sm834747b3a.20.2026.09.18.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:31:54 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:01:14 +0530
Subject: [PATCH v1 3/3] ASoC: qcom: sc8280xp: Handle AIF MI2S and TDM
 interfaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-qaif_dai_id_support-v1-3-ed863c0e5e45@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738297; l=1593;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=qnVsk++1S0X0GRg3DxqeDr6O7Yc+8TFQ9tDUsCjeKJU=;
 b=wIVV2/m0aMbOA2Q3vfmIK9vkB2u0NWHS6RsFoCIzhFT4x7tqdMzydnmf6e59+k2Sdq8EeqIfC
 EJhylQAuUDKAbhTY2pINc0StWDnOP9lCoa8P6cKm+gfIpXVCLv80vGs
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX58aNGgHgIY3t
 HBmMfGmLgRGidv75ZKaWKj1vSfqW59jgE9zR7eDI/tfHxx71jImRGZV68qFwrPQIO2nWOzWGPwC
 iUqTnRxFgGjhADexo3r0tDmuP7F06mRpt4Wpy7XnWLaVEbrqfOT0rxwpVuZG0BTWVSAIs4b2l32
 /DSayNMSA/9NNT9tJ43skmt007nIYtGot4CZza2O4Meszh7eiYD6uGnVFH2yObzLqnkk5pP2MAX
 pb+sYH0mONWOADT8OWQMwB+HhEfbZRGQq+ZXBq88RL+hrtyatvPt3wCfKSkw/CGI0D4U5mQgJ/k
 EIcq/IxS4nnnGQiQ9PilDDM6YDyrBvY7HX8cc0eMZoYv8kkUUaSDFDxwbql1t95DfxbJ/YPkvqR
 HbY8aV0wF1TJBzuX4JDOPm9q8IZKqzTprRWwcOUDksu71e5yhXgSjYEWOgBnk0wLI0+oAYlG0mu
 /JX23icFjdUZD686vaA==
X-Proofpoint-ORIG-GUID: b4mXao8rIwfagDAdY6jozf6qypnhLZB0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfXyGCMnqdZH79A
 ZwMZlsLLHJRAJra8VlCOjyheSxlVsveAG0tbTAo1OlWk63GFvJB4FlMtUKTVIx/lIfgETwapJb7
 Q6xYNrU7rhHD+B8dTJrW9BExFx3jIQA=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad3d4c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qGtJ1NKCSgfaheF0IAUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: b4mXao8rIwfagDAdY6jozf6qypnhLZB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180191

Handle AIF MI2S and TDM DAI IDs in the SC8280XP machine driver
and extend LPASS_MAX_PORT to accommodate the additional audio
interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/common.h   | 2 +-
 sound/soc/qcom/sc8280xp.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index c1deac109f24..18171656408c 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(LPI_MI2S_TX_6 + 1)
+#define LPASS_MAX_PORT			(AIF_TDM_TX_12 + 1)
 
 struct qcom_snd_tdm_slot_cfg {
 	unsigned int tx_mask;
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 4d48e1012cd4..0876b9be136d 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -260,6 +260,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
 		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
 		if (ret && ret != -ENOTSUPP)
 			return ret;
@@ -296,6 +297,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 		break;
 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
 		return sc8280xp_tdm_hw_params(substream, params);
 	default:
 		break;

-- 
2.34.1

