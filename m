Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5052A47D938
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368932; cv=none; b=gDyBxAv+UUeCMGl+PhnM3sUPaNi0leYxX4dGUzWqkivBXdM47FQIvagzWwChX0B4EH87mlzBfVmeWykKuxqY7HfpAe2tkTdJ+wzDR/g4x4TP5i/EC1Ky6urvltPUy8BFiCkNJqY8/7k3XXQtpwMJmyiIM8OA+ALu7cHwIEmc9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368932; c=relaxed/simple;
	bh=P1VW9qZNU2PO7nWf+4SbkVXbQmsxX5uacMO6IpPd4mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htott2ziCUMv2nC5GXPKmReQfeDlY2A35RqDAMTJ1GeZuQ62fZy5pItLzbh2x/X+fif+0cGMU4z88tlBR9PDIOAQczfVRO+iiSRFXVp8TzsOiRVl0RuCpxV4TSDjFNE5TWIelc75tCDcsozYcebeC9doTO/uTYIne08An7qvQJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6ErBFSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZzmwDwZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6ErBFSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZzmwDwZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jePc3334685
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 10:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOTCBGC4OyDLSs0CtP8qztEcifk/SFN1zH0nwoPSTH8=; b=Y6ErBFSf6xe3ZE/2
	gPDCFeu1EbCn5iZUcmbwT60fVFH7HJFpVk5G16Pjl4WD//LhQwXu7TJ0AJpo9qoO
	NICO1rZfV3jQYXfQZF4wNwEKhCvwsDydw+qTP2bJFReeELO/AHNSy1BZ5j4SYT87
	YqoNOuOF4RohzL8+ehdprDNRC1mDuRwQD7TDwx31f8S2Z0Xv6nb3EyLH4sHLTCum
	cghHLcgbB8X8aU59H24DnJ5a944QJh8H/BZ6Q16zNDq2KwcUZcvgpLO59Ss0BlmN
	OWnjoI2eT5pCFziJEbYlSXZrfjVCyV7atCbaumkXVE0md/4EsSLtNhO92dK2YIXX
	f1u+cQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623m2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:28:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8af172664so481986a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 03:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791368923; x=1791973723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOTCBGC4OyDLSs0CtP8qztEcifk/SFN1zH0nwoPSTH8=;
        b=cZzmwDwZ605jtjCylqWcZ0k4YnCu3sbyZU5A1TV3qQRqTAIYpFkDbUiNyaRgZbDN0v
         y3lyFjQYagIYUwuz2++TT+VVK8eJiLPMCHM+EP7aUpHv9Mto9cOHyruUfnSu722i7/tD
         xPpjy2fLh4zeuz6qHqN0EYGmzGKG/hHQHbE67UvNtqPg5j59xP7KF8OZV96lAeqA+Skj
         aHNFQaYKqUXrGj2D6K5LpBPKyOwe5PVcRp4omTmtSkAuQ0wzzR6jnvzgF9dsHtaihP9J
         wT4Z+8XYXr/ryDoBGcLG2Vaivy9zTK9Q14VkiCNgby5eTOTsPZwzbU1eAYPS2pi7w81s
         lSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368923; x=1791973723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOTCBGC4OyDLSs0CtP8qztEcifk/SFN1zH0nwoPSTH8=;
        b=s4DM5viGoN1GcEn2idOtYQjCMfZ/ZN50PplSdTLf1mMow2uxuNaB7aM7V2O97/QS9I
         RYdWaOjmHUbLefncrNQUn6NPohqDoLajBiPr5PUtRw5C5X9/METTasilW54Wl3UMSBE7
         DUmY3cW32ofdR8sq82cEeAWijXL2Es6YnD2rJoDTL4+fqTuUbOSW3dkrB7A+Ap+y/BOL
         FWBT1W2lDWt1EZKLVzkleq766NY4LdkzkOhFa6nTfYE3u2KC9i9RuJOF2Rmg/Zty4Mv4
         tL9NJeQixJ3XuH/WQ4Rt6euAOWFA3vWIQYv3BgsnWDyuwgcAojufGcnmHyglPnrvRN7W
         d9lg==
X-Forwarded-Encrypted: i=1; AKwUvBzOjEDsR/GYrHvr9KwrXzpJ58TkMR8N7ZkEfHwZsxZLgp50K51ETLb/OudhtFr2fgySY2QC2EHhD9VAItI/@vger.kernel.org
X-Gm-Message-State: AFq9FYIPdLpXbZVZj7cTTfcFFDj7K5rkzpmHdqshlD05Y1m6THZOm7eG
	y8UxnrR3FsU+Ztvh0aqCXwyyr2apw7kl3THNNyX8vAxNWAPW2LwC/6vPbfjBvmPCgRt5fo4+/ze
	u0CxWEfaG6D/QVfcJ3Ir7U2JPTTU9Xzl+jLPH6vnD2vv8g+jOQh4peZ/C6+9W1pFGgkDB
X-Gm-Gg: AYBFou1MkSMBBP1Nb7MSUDwBXC5PgXYzM5Zzi/HhomvqZsyvSYyIvA0rQklVqBhOjWi
	b6Pe5Y0TCFOeT93B0xlpZWTVkX0IVlM+FGgMammSgfz1c0BWT5s8FJQCxLzMdoLHnlJjuxBwQaY
	LK4guu0IqucOcbZ9S8SsDzHbIxEBhPoQvH6umSAmIw759W64Sc/V/uFrrpA28nz1SXDuLGLZOPT
	xsQVNr2ftbTrPpj1GVBRvkCz0s/E1m4DSItkrxh0n8CQVPFyxm7jXmw1/9Bf51MoSWWoVpb0goO
	4CM5tb2knQN/Zl7BxMhxEKxTK81nZU0bTRjwE0ReaNTlWGNk73nKyhrQ0hXasgwsD8j1wT5bNTO
	YnAXvolyF7OMq5XwWj31Rm1prDurFzigc
X-Received: by 2002:a17:90b:1dc2:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a8a1d31ea0mr1433394a91.49.1791368922475;
        Wed, 07 Oct 2026 03:28:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc2:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a8a1d31ea0mr1433373a91.49.1791368922000;
        Wed, 07 Oct 2026 03:28:42 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8cf2b69sm1221334a12.8.2026.10.07.03.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:28:41 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 15:51:17 +0530
Subject: [PATCH v4 1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits
 in compute-cb node names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-glymur-dtfix-v4-1-31f7143e759b@oss.qualcomm.com>
References: <20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com>
In-Reply-To: <20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791368909; l=1332;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=P1VW9qZNU2PO7nWf+4SbkVXbQmsxX5uacMO6IpPd4mw=;
 b=smBQGNatFn9Bxb26aYoMObCnLN/G4HYzky1mfOra2NHk+DqpzZ0ZkhO7kADLXBQGVIZMn2xoe
 EAxmNzYkB9uB/p7hpdDjRO14b/QGtQbVfsi32m5sxVUyPT5GtgGbe18
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: M86MEPfUG1b2_3tAMauVAh22_7VZR6m7
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac61edb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=C3F15k_13UMA7PaxDcEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX/fGgnfMNMhRq
 fhqyCio+kuKV5UZet4G8iw9Mji3GJzEQ56Q17gxxkFwUqvnd/LJ2iHJwVb8ISXR0EG9CNfHKh34
 s+fNMAQ5bR7AnZYKIq/vTcl9jcDyhyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX5EbaR09KJSx8
 W6YPYjZFeByoQ09FqVfzTQzDb/FpJEUfO31lhVZyb8FEbSgUBF0vETyWfsbQwIri0/r6GerxvLC
 wC4f4mwd8RTWegT5JEAUq/nYhyyMGl8Hj9i6f+dxWvPZnXWnAqgNU8U2qiCKm42ol4oteLsLytU
 man01BEeC13CRa0s3nlxmGEPK/CzeWPtXe1HCpyLNGWvtsqxZ4aMO3yH4nZxEF+QJh5a24DFQfb
 JHv83aWIkjkLptOoYNOObv4OHhwyWXcQnCX8PkRypIslQEP3msVadpM+Xmaxy6G7LEVBMms8/nX
 fkuNTfx+tkuO7CCYcQ2rnRiS8FqX6XChp+Q9aAOjAKurEMjt/ycL5AZ6T+erL1vdWPoDY2fATj4
 /L9HHtpisBo1rO8Glyo+/Jv9EG955iq3wZWaoVaJm2skjmd/mRnd8dHBggdAMEcW1TbQwEOSAMI
 77yNPgW3UlxX7VO0ITQ==
X-Proofpoint-ORIG-GUID: M86MEPfUG1b2_3tAMauVAh22_7VZR6m7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

The patternProperties key for compute-cb subnodes used [0-9]* which
only matches decimal digits. However, per DTS convention, node unit
addresses must be the lowercase hexadecimal representation of the reg
value. For compute-cb nodes with reg values >= 10 (e.g. 12, 13, 14),
the correct node names are compute-cb@c, compute-cb@d, compute-cb@e
respectively, which are not matched by the current pattern.

Extend the pattern to [0-9a-f]+ to allow lowercase hex digits, making
it consistent with DTS unit address conventions. Also change * to +
to require at least one digit in the unit address.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..d9444f452585 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -79,7 +79,7 @@ properties:
     const: 0
 
 patternProperties:
-  "(compute-)?cb@[0-9]*$":
+  "(compute-)?cb@[0-9a-f]+$":
     type: object
 
     description: >

-- 
2.34.1

