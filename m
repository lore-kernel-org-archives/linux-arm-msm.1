Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223973;
	b=ySWbIKPU0GqzVWjoPFX0hxEiFhwTzkBvuJxPNcJvFjB24OJijSU9nDoHZxLEzZBckNiQ
	 4UpFxIAEK3fF4AbAQY+AasPnvobbLit4VBN3N3yHluNrcdI1EhFuOKckkIUDY6zWmztbd
	 BOghTFLlvsks5NG9t1PHotNMdE8q38845mE5bMgMucHgV+Hbc4rH4Ym3isLBDu86BhYQC
	 k0DXPvQY4XqGEtzPEFvFQCYSgnD3ElGpv0Kg7kC19iT6IuFbooQf/F/ScbuscwdccEn/O
	 EfhDHIMTcD/3O6HJY1O+YDBZh3wfv53SWc/PAjM7j5VejfALgSrwB+YE2Af0OHX+b0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/rANUhb4Xkx6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=;
	b=UgeXYuyPkiwFqPC0+96IRvbL5UFRqUqKAeRJywgbwX9xJlA2IPIFXglrIOL4fUHwMQdx
	 /HAtfS882w/cqFoyIj2VEAHNquNGPSrXXNpyoL8erYwuR8IiSue7wJek0HTIiJA5Ek0Nw
	 pZmj7ezN246odWWnwBmZ4VsUmF3wCOQKNtYICTsjxJAfGPkoLud5jqN/hY0iVEHukpBm7
	 3zq8uSFUbT+P7xtaHNu7zx3s1YWjJ7rsIOKCEh1So6W2kqeBflyD4fE7fIlEIZfdF2wcc
	 elhVfnj1+7TOUUXVLMP0EuLBxftpTQ1LviBgcdzmg7eEVrZM33GUua8xfLDDer1qaeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGtEMaAU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoVI5T+j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB9E60A2622
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB9E60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nGtEMaAU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoVI5T+j
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIQEHS1581355
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/rANUhb4Xkx
	6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=; b=nGtEMaAUMnY8ZfsjlaZ2+w1jLt7
	L9Rx1iOw7xpmjdJiDoBju41uzaOx5ALU3siJwlPSCuyIc/BV7fUSjBDE58hEGYqQ
	d49m0JdYRqoEjx6QMroaCia2VPcjaXA5XxjpUTYTOhc0+a3GuJLddb+n0WhrTUxc
	qdV5BwU9Zpojo/mn8d82l9AedbW8G7iqdy6+uRoURISPJwZdQgXYtepy4NJeiSDA
	qFbuingji5YeNLrTVGgMhu9VI8Pv6jq21WpQAGEbXfCadbLLQAOG9/jLMS9z+loR
	8sewKtB9WXhjcX1aIofMer9wkjyYgArS/DG/AX9j2MGC5SyiPVFM653jkLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkp8v43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:46:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso198957885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223972; x=1793828772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rANUhb4Xkx6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=;
        b=QoVI5T+jRH+ZxQ1uTqZEQixINE2mYFZ8zqc+6qOmLHt8uvaDwGNWRu7pFYLv5/Z2kK
         flSivR4TkoqlVosdQl5xAwddMTBqst5BoOTjxT2MZDYV1xfQSv3KQ4wRgvOrKziEMkAP
         RcUGGmeJAdKTVlWeDtZEeOtST4YRKzADMFTgA1JiOG77swoJHfdlUsammjLCMOwoUc2M
         6+j2aNBdA6Z06ScOMRD7KVWbCRfAfAGvYEYzp/O7ByPohQ6HOXDIR+01sNaVajn4WzhM
         fT8pVwEGDmok2pTz0fIA6V+CW41mas7wsXwkbUYXVPvubZjNbVHXCXQ+UYSVenk/YcRu
         g/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223972; x=1793828772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rANUhb4Xkx6JtKbuxAVHCjVLfvsKmA/04qLJNQgDVM=;
        b=BT/M1JipjiH7s7pN+GcURMmRX71eJwulvWzLcBiO1XkYRR4wS9ROcagGJaEBthlJNH
         0ImjeKhEhLch7qVIiyqo59gbPjxtWgOH6lLOVB+Qu6/yNnfNecbaePM6dGTnJlX3VFVg
         nBmoUpac5u/3AwlaNPEziLsOXWRHPeUeJzmMOVgYdMKX+WbVkEb2nOvh4eAwFANSvYbb
         OC7cByAkBn8oR0j5RQs0G6kpe4OQsiEvsblUX9WhrwykrFADw7jNZzddDL6rUau8BB4d
         5r+gTNccyvvlX00OI4XY+hn8ogJafytpFAUuYhFAoh3CcryGG4kYgBo4OohbTXeXKYa/
         JtdA==
X-Forwarded-Encrypted: i=1; AKwUvBw5QA4bB89x+0UJqubhC82FZu/79f7Dod0WUFdIgrA+xZBp4xpOFzSghCYXIu4Om0Z6MfpLjDPtjRCAKOyD@vger.kernel.org
X-Gm-Message-State: AFq9FYIMiFOvRGgaxUdHI8/ULrvmrOFkYQF6MVcyjLoqjJ+M8wY1diYR
	5h09boFzVrbhhSk+MCSBIucVC5bu2hP3ndIVLpfhC/7k01JLlcFtD6EZNTuTf4PT1GemSkAZUYs
	fVDYgzi0gB5lew/gcgyXA8vl157EgqLXpK0WHOGFrElp7a3oe7ut4QVqhVzIdeQdMdROd
X-Gm-Gg: AYBFou39IjLvDat8vqHGEVr3sWSK3WkVtpz9WVhHfpzpNshYAbvnqGmTYnCrtm7rlkn
	HfPN/piKLbLnR/b1tEtzG1vWF5igsI7wAv1bkR3xuwnJjf4MC7aoMRU+Evkkk6fbZII1C29FWu3
	wyuXiGF3z1pde9KFjBur9Eu90uAgAAqYHDgBPdpHLw8/mctCnUGbiBjgK27uZ7w2Y9CY8foESUY
	plB0eSEYbn7l0pMHExEXM+8+BKBlfq3xQ5kZEKmOmfGil9TKZr2U6oXzbB7qcXnBcCW68gIRMV0
	b8vrM0IcrUqN3s9FD1JGsRIvtwlOjZ8G+WE5K1O84Jh4MPXuFI02nNo8fwDsmt6jnkQag4UR7wT
	4yWTZgozGP0AyEm2xMC0TGFb84Z3+jsaSyxL9inCZty3doCf0KKCq8ntYd4EAxw==
X-Received: by 2002:a05:620a:40c2:b0:940:f224:5a57 with SMTP id af79cd13be357-94408ca17d2mr582262585a.62.1793223971627;
        Wed, 28 Oct 2026 14:46:11 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:940:f224:5a57 with SMTP id af79cd13be357-94408ca17d2mr582259185a.62.1793223971096;
        Wed, 28 Oct 2026 14:46:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fead817sm18642395e9.12.2026.10.28.14.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:46:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: monaco-arduino-monza: Add label to sound node
Date: Wed, 28 Oct 2026 21:45:51 +0000
Message-ID: <20261028214551.108424-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae26d24 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=cphMBCBa6KgUlh22nVoA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Y6rJGUyS7cfCIEEoQAkSaih441OAUUM8
X-Proofpoint-GUID: Y6rJGUyS7cfCIEEoQAkSaih441OAUUM8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX1MuZZh4q818a
 UJZE7IaVvpUCC6JIwkk21G/Q4LN/tEsHa7uzDJBCTliWuYUug2IMki0DIZ58C57G8cOd7BdWjoT
 K7HGNZOy1tJ7BaMccSLnf+4/eaVpKE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NiBTYWx0ZWRfX6CYUcU+S3lHM
 5Ytt94FS0kQPOFAwGFdwJJ2Z80nA07N3mJocc2icgsXIqYvMbuBI1Xz+oUcp2HQ/bksjIvM+Ef7
 838pdN6xXJxYE/YJW5vrq8e1Qbn6Zk4v4okFOVFGWSWwSpyECUNCp6rg26QuiYkPs9YWsLKagWD
 xfWwK5YgYNm5cH5j1MqNsGRE6ZasPhgvXCbWRlb3H064so1Krtpog8up4USdNnWJbg8CF3hEhMH
 TjNIzgK/3SYD9OfdcYrKPppnfSsLAPDR1xwckj6/0NK4NHwN31UVepyNFoHeRsfoo6+aX9UAr4i
 JX7NGpuLDgjSISyf84MVjnv2i2Hxc5MPAxCLtJLCndQLjSWBwLCgGtPytnTiSlg0BiNuF2hbC70
 bxBm7G8L2CL/eJOS8C4BS8NQNVrWIjWdYcP+sTzRjw9xUfS9VEdqlfdQRT+18FsCgyQuPbsO61v
 r2OdqEbR/Jtz8kYFzJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280086

Add a label to the sound node to allow DT overlays to reference and
extend it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 2fa652f3ae58..9ac2a04b302d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -63,7 +63,7 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "arduino-monza";
 		audio-routing = "IN12",  "Headset Mic12",
-- 
2.53.0

