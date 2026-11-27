Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772531;
	b=oFuShL9LJ58yDNgbTLZheBxKpAGgQRxUeJLmrSrsT02Oq1SMVmWtNZ7+jkXvYDzJ1JNo
	 vIXOHDyGQPN4VXrcpsQRuh/KeEbxvqueC4eNXNxBI2Q/ETOFzYjTBiDCZSzbgUVAyL6Y/
	 PME+jLpFzK4v+Pxwei75UvAhYwAFxh6LxXAfVBdkBf1rdJSgqu7kk5UYCfZZmUDrp69V3
	 eUOkdw/lDStFyJUFZP+L/qHltGEUwZjWU5jle1Ceh3P6QPlDoMX/teiSEXVjn0EHaHU7T
	 jh3NdEnAVUs18GWopIpSeyR7p8G5SoqN2sasUBvPY9w+uvM20L0sIolrhUhZ0UvMIhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ao7/wXB+3/09MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=;
	b=zOJzVmB4u9U3DSe5Z9gwGk6AAtkHXXUB5/jwtjNL8/hetDPCfG+86EAPpva8i6kSCGoo
	 AqnerhTjJQUx2RhHy5SgzcGF55R0TXDYCmKUeT2yddT1Ri+WYDdO8z9lO2uOGP8qmmeVe
	 n9iHVCuguygohwPxwQrob11udPX/1lpvbeNWBHWBXkhv/vF0WXBjof8DiDzZcY78Tro5V
	 JT3UekC9r5sOMfD90ey93iEnQh75wn3PzUYpFlPvR00ZobLHQVSYWapZ+UB/5XkIPo8Aa
	 UM+MqbhLAP1HQBXDWMB/O0eIvx+awlqhC497SHD+oD0DQ6OAIS0gmvc4LbIRqhcULMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T9qmY/OR";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XQx6NqJf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A1606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9qmY/OR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XQx6NqJf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GjcZ2421573
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ao7/wXB+3/0
	9MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=; b=T9qmY/ORaQ/eec7EbCnXPgZufqH
	0tetghcIMyXod3hHqUkKDFyuhsogvweknWot8pj4G5a33fGZpLv7qedF78AJuPKU
	qWVU/Za5PDKcN7Gh2mLBa95GVx2ZNbyMC0DVGd1XTLD+PD9Y0WMYEsiplbhYfhRr
	7av1iqVe0OfH5Ay4B5XBotONZ09gnIYY2CTbHGNz/+aNYbDFf52in773lxMsd6vO
	osNLrShVyE5Nsibk+aFzmMtJ0dwAVhYYYRxhyWRMug+FZIKFdQWqZ3mOI7C9NSzE
	BDtd3BzsptVLxkIvh2N1OZk+qVJUCQvQ4AhI0+RnAi0XEtMu1pRzprVKb7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92vdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:42:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b42c3dba96so9173877a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772529; x=1796377329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao7/wXB+3/09MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=;
        b=XQx6NqJfPy90ngm8wqvnAPHvLgMRst8/gnf/Jgi0SlveraujpEcHpJRjJadHCgw5NC
         hAdAKYurzyb3NTEOkeX2rZIHuOIsDERRLBr0+CBDdkmUeVIBYpfKKHLuOWay/t92MD6U
         487aw/TM0H4gnFrnrhYwKrie6CO/qWqTy6tztgMT3CtV5EanqlFKx0tPu055RlkCJnHh
         xkBE2vwzSOdCFHlW1WO7EMVdSsu/C4+Ug6DtFXyKia+46uYqyT9lNGmuymbCNzD61UNx
         SfVwojroC3B/cfsGh6UNmIbbzKqphAg0d9QaSDpuds3JUrXwYnpZIpu2FH2tXzuHmMz4
         IWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772529; x=1796377329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ao7/wXB+3/09MsyV9yOdjkCOUMTfKupyz+iVks+8Wfc=;
        b=b7tZFuWi0LXQRkzQc2xckpAs8kcaY5IryLjH/O7su4GWLWaeP4xKKp1nPPyDT8Dr77
         g9KDBHE+VW7BNSuOMBGL/dqxbxqCCS1tzxcyl0xBZIBpehxtIe5J71fbVg8b5HeSfVR9
         Sn6FVWqZ9mZ/T8kv2g3piWsQxWcuR0I8YGJWa9jMeVN3M/qZu0GwFtgyko+La2mzkrRr
         Gz+KEunYe4vS4SGLGLVzrofe+T3LQ1180a8ZwRxfPPk7fjbfz8oBMgOZ5ndqwpJ9eSiQ
         DoqkB3025NRM7v5IOL4jwSoGgswyTvFrnMOA2JzdgivfWhx+O3z5rAXi6M83rxNlxEM8
         4M2w==
X-Forwarded-Encrypted: i=1; AL+hErHcmo8VKrSZKrabsQyXViNv5UlbFoThX61HuxYEmzi4jD59Ww7WLgGNiuhkH9z+4A8Sw7IOh54T27376pWc@vger.kernel.org
X-Gm-Message-State: APuU4Z/XFnXvrzCVQWBo3rQhT83X4xzRzBU/ZLWW1pH2am5leY8R8n3+
	lzdSYh9yox6IOysCPxymtyJ0exQCxbNMT4MY5lt8EJ9HH+t3W1ZWQqxq64mhZpFo6RNAY+Zf6A8
	r1uS+FN4kpu++XzJ4dKTVN80fGef3xcIVHlX+41FVhGzKq8gEmsXeYRXtcsL047tMYyom
X-Gm-Gg: AZFdTZcJLNXbv4vQwBtXMx5udNixYZjvkpB3AChk86YdPYNprRSMyrM1DpU86J3+qvg
	DgSj+5VEOYSelpy39Eqn0O/XMt9hvZSmmhYEukuxl6MnW62YRlf3ubJXnsgUtgL7lc7t7ZPVFTl
	rFxuGlV5alfHZrXyB4n6V1ZQ3cZM5lHRODSZ02F/5lCrbdmPkpnPcfpPXrFomzMMmTnYq95qyEI
	AZDuauxQx1l2Ajl9euMQgxehe/s97OzU4norjuVSOU6jzX/iRmZdzDwMO7ekTxy2ofi+hhjU28F
	r7Y++YGCvVdNGy2aWIUU1aAcaxuOuB8+sxeUDnNSwhQefjVAdPM5SsRxRVxAiDcBEpUOzjbk8Lz
	1W2IQXL3VrxEIunfNlWIV7Y/otLtUz5EXDQWfBSUEHLCQwmATZgxNMVdWGta27Uj8SSXbntM26T
	bx0YKrJI52m0lt2ns39LYLxjDKdP8aLLMSfMavcSU0/5kuT7jl/eNrGkQ=
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr24941287a91.67.1795772529208;
        Fri, 27 Nov 2026 01:42:09 -0800 (PST)
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr24941266a91.67.1795772528814;
        Fri, 27 Nov 2026 01:42:08 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm16474788a91.1.2026.11.27.01.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:42:08 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Seca SoC
Date: Fri, 27 Nov 2026 15:12:01 +0530
Message-ID: <20261127094201.3296395-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179553708459.2320507.13109534858158405044@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com> <d92391a0b2ec19bd4d8ec0c4eb988cb0c8176b28.1795517711.git.yadu.mg@oss.qualcomm.com> <179553708459.2320507.13109534858158405044@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: xHNSWvtEA2UnTViIrGEbhLWcj_eJNC_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX+eC+hGlMkHnx
 SumI1lMMEvP/WAur0UZMporMQ+oUTr4z9fPM0K66Ch+IUT0f9/leX80YAO477NWhGOdcFcCZ4E5
 DWZZUs2Far6nCaYi68O9imHBAekb6iOkVnfL544gvcr7Qc1nKEkiFwvhcNROgytqKPtwuzdtXwU
 ZTifeB6eKc8qgTDeSLVMyxd2d7hMuuwOGQqX5xaeZCLX4lNcIfYnmoqlk58m1+2ezK0+L4iI0lC
 wO843VS77eH8YVN9e2ZIaXyrYf96cKtTTzsEvdcy9xR8iVoKkMrQSXycSVLMene7jdPY8DodCqn
 JoXQCOcyDdQtqkRxHwVrXgTq3LdjhZZlUDJArfdJrvEq6T0UzxuSQXFeR11n9QUK7llIsB3BjKd
 RHDJGQFrhR87S78oDV8FX3lMClHeXDHZeD2lIqi9ZOHtJlA2eyvt8lKrBRxuU9XRjb2+yV7QMAs
 G8tWT+YweDZU1W+wbLg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b095071 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c_Yg2YlBmAq_miF6-psA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX3Pb8YXfJ8jPG
 s8YuHLR+4MnUVCSr9FC6EbugksGOCzjoSvRNC4BPkv26bYOg3V8fZbuq1/NaKGFGDlLQ9j2wacx
 9tQ7rvfx1YJmWZdwBhCnKdP3i5HWPQQ=
X-Proofpoint-GUID: xHNSWvtEA2UnTViIrGEbhLWcj_eJNC_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038

On Tue, Nov 24, 2026 at 04:18:04PM +0000, Tyler Baker wrote:
> > +                arm,psci-suspend-param = <0x0200c353>;
>
> On Seca Ride SX with stock firmware (UEFI 2.5.5-00052) this resets
> the board ~2 s into boot, on the first few requests for the state.
> 0x02000153 works; the firmware rejects the other variants.
> The downstream Android kernel boots with cpuidle.off=1, so it never
> hits this.
>
> Is 0x0200c353 supported for the OS here? If not, use 0x02000153.

No, 0x0200c353 is not supported for the OS here. As you point out, the
downstream kernel runs with cpuidle disabled, so this state was never
exercised there. This will be fixed in v2 by using 0x02000153.

Yadu
