Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302175;
	b=PshUmiifiboSVLAsX8fEHZ46gSJGnDpgrw6uHTYdEsjlXKBH8OybGvYKRkG7Nk2JC/tw
	 D+8S9fk/v7DUV0yBEXBCb1d5QEZ6oMVf3aKbpMigFhA+qYvU3ZbD8NiEe/Jb4x55ooBP6
	 C5F4oeyxqPTcCfxD430Vm7/VqfED+FmVQMgqKEKGrCXvaqjQARtneggKeVhH3yCpFegtz
	 +1TfQ38SiVR17GQB0vY0N3RHAnignvnnF2oXqfdGD//XzoPLNpM0trvmA8mq0D3f2AH0N
	 wNvTIGkPtDFn8fx6dmHtnASFe9KviFgvynwmcrMsEDu6Drl1vIlJgN3+mSQIGYby/vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
	b=1SCf4weTHb1fmTdcL1VjaF2rztuIoVAAJ5ir3MqJQpmCpDLRPScO83bIEbYPruaiCSL1
	 4aFK7NVq8li6oxUI5WX6Dp8EgEVBemfDFsPaj+BkamuC+F0PdU3JrS/N/S0l0MBq6ERiy
	 Fm7rc853HT05REh0mPKcJvs8DG8S7/8/alG5AzL4eTnt9uoO0kTEnZTv/FP614PlMEov/
	 nxbjwkCYPjmdhqZSTCe/enqdhSG+VnyFULPVjbvaGFEFlY5uBfVCqG9OBDClWEa7I2Wji
	 v4Fe8KCk2SWQVqTa7YHIITJ7+xMrmxhigMAfb5HLYn6S5+yl8JcbMW5Q4jUKNlSWmzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1xZXcZk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPgoMVHe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F00606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F00606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1xZXcZk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPgoMVHe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kpvv2779857
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=; b=M1xZXcZkHdP5kZRa
	S7BjIj09qSnLZ6/gl4fhESylDLOZgqgobSQb83wNpE6n9kYhv3shZxrQ8MH4/VyN
	l2g5F3mkbnwqKn7d45aCWZ4F5np+d2PdCETTR3OvyqL5Fh31fZfwAP2Uif4/j8Ff
	BT9S9kVCMwqsU0py68A33cdwQWwE26w5joeXhv4JKYv9tSxe9Uzbr2qBZeCPpdsq
	hOxgahLFzUhm+kOX2Ydh4am5OULhrpF0ojIhZo6VnN7wQwDjgLqA7bKAelN/AHjO
	YJX3iF8iOR6dwEbAGWsf3e5fnqKcYQHxLIY5Dftt8Os2KKL2aYAWL2WwjgMdXkfS
	8KFVrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d8bng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so327956985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302172; x=1794906972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
        b=VPgoMVHe0tYN12oRa/KuAaocdtVbOjLTamwzxlhCyx+oMKmX4c42ahsw3vaa3fyQ6O
         sLMamX2RawLejZm1Da0Wis2qDEWQyGWlnOHzRXnECxyZQJhA/VxOMQ64kiS4zZzA6/qI
         NQVHFfSjBsPjDXVEuREh28jUH8fQ5/APUDjQHv1/BRpGh0DRnqu0lFRDN05VwsNa/NUg
         3maEtDg53YAYyORvX1J8DLD8dRpg1mLMASsu6c3G6pbayBTcyGTvIbmgTmOvOQt2oroP
         gm0DTPhE4XPGtXfyUuyY1NIESyT1W+vKDqnooQEUJ8yx1MQL4taBmEUgZ2yZ5xh8QGO2
         nT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302172; x=1794906972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
        b=kTGsLEVPc2fcMorUZkfZ3y4WTY6ahoxsAjOUbONDx45JHg37hiiBRpCazuK/1num4R
         R1vvYNa5NqIIYySxXBYQqQtC3DnP1/PgqZO/6gCJbaUGLakhhpgSUJ9irC2wOhBZjlIW
         G3kGQ7Ri+fRow0V3oVYZV3RhMj5L3D0oCMKGgZVkJg0D16FYONQElgELhEVaVanwtNck
         qtoZHkzlShRObH8wQ+JUlE6kMrIvpvLCjuZn4NfX87cImPVnu07yHymSGFxodTovnF3+
         570C6F+PcTQJqADsZVpZgFExkQDlYCAC6S183v1Wbg9Id9f46kyRUwjqNjzJ1+RKhkU3
         w+Cg==
X-Forwarded-Encrypted: i=1; AL+hErHIkk/XZzc1BjfIPLTdrN1eOef/Cp3adw+Ka9DPKldQRIjWQ1n+eldr1bEDLNA6f8B8B2JnOW8eAoFqZ/u2@vger.kernel.org
X-Gm-Message-State: APuU4Z8hj4dzNKtPUbQQnefyli/LCdSTHcvQtza/bkyoZSP6rPxeRUhz
	g+q1nmyDM9d0LAjywcU1t5c54AmRIy4e+4yEXcdRpRcoCM6hTwa30dE/v3Xzj+X+cNOQSYbAM7K
	7xxSBEfTQGoeTquQz5SrwtDgW4HQhYTNeyfFacOFQgDzWYNvYKN6s2eYu898VuDUSnbc/
X-Gm-Gg: AYBFou2Sl8TStRqZhBwwPp8gqP+Alf4aZPyXkFHEFHsSiWUMnDeZLkfpiHPEkVjeTFN
	7wdA8PFX1JrqDDrx/ZX5/kW8nognkMfAzO3lxDLdTce6NBAKvypXEak66rx/tAKH62K+S+I4Jk8
	vihlAP5kxydeBy1aFa2RnMZ8YUKAUy1QYlQJU0ACrkfrLD6PPhB02SEootcQdvhSjX0JWfyJuyx
	14VDeObE26nd1G94tZIPsopmzq8tvv8Qe+aYn/9a157PnLvazqWIL2n4cj+GpQpVoqNNCFGX7a9
	DMh7ckOS7nJ85gVsAl9IZF/cZ3/jorVI4P2AaXAky6mNmpb8saxJdRaMwl56ql+WnZwMyDQXNbV
	MpYCjFekmrZr1+Zmt97BOdiKUv13Q5Gkjd8520uccllPOy8Js3+TDLc593QKuxKJ+X3dbGCFwQI
	qa
X-Received: by 2002:a05:620a:372b:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9479f34050fmr319498985a.36.1794302172352;
        Tue, 10 Nov 2026 01:16:12 -0800 (PST)
X-Received: by 2002:a05:620a:372b:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9479f34050fmr319496985a.36.1794302171899;
        Tue, 10 Nov 2026 01:16:11 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm3833527f8f.44.2026.11.10.01.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:16:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: add missing tlmm labels in examples
Date: Tue, 10 Nov 2026 10:16:08 +0100
Message-ID: <179430216678.5751.5703304035925028288.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
References: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tGoZObl9nRCZN2tgKIaxMTAn-V4NiSAP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfXxYxPgngHkUpX
 Q1xn+9UutckVNA6tT+1a/tyvhtCZPS6NXZK7Uyf9CquKbBgFz76Ve4Ax2wfFqGcCGPWApXP1IXU
 BB9djcdhx0JG/lX1beuKcJUOI8ottiQ=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af2e0dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qIsIWIQgnqTSJORAk48A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: tGoZObl9nRCZN2tgKIaxMTAn-V4NiSAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfXxOPkD6soCCpj
 Iqno+b2J2p4e0u8HYW0InnjEKtbC5hAt7JpGSse9pRDvWYLR4IETqOhL906XtoVsQylG4k7bYt4
 p0UZLz2FO8m006VwLrGO/pI2y9EUmfYKGRTNwKVzfU/R821L4BCYfm3uo2RlWdZt54BH/Agv98L
 cH5Werb1BhDAOIKyY3MZ3iyI091R8C3EPI7cb0AjiNzKTAIEhkquTcDtYSEG789u0isG1pZUsQ3
 2PbOZKk7HlEgjiB+XA7xjA1HCkrJGCxwQ563EPqTCMcsmkBR7WhvexaxCnZW4yQodXzIaemXN1S
 +Kp9cAfguq9Df1t2nRbrFX9GbT599wpEIqJJWvhl0dBBS9QG8m+aohWqQmvnJ2r9Ti42syb0Rd6
 +krSIKys3WxsL8IMM5TK9ooldmhtxvwaPkEuNCP4mua3QDxEueoB3OF2EekuJedGmmKyFEBVjq2
 ASVizo4kfUpyiL+D5Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100036


On Mon, 09 Nov 2026 16:57:25 +0100, Bartosz Golaszewski wrote:
> Several DT binding documents for Qualcomm TLMM pin controllers define
> the gpio-ranges property in the example node that references the tlmm
> node except that the label is missing. It's harmless as we ignore
> non-existent phandles but for correctness and consistency - add missing
> labels.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom: add missing tlmm labels in examples
      https://git.kernel.org/brgl/c/54820cf15cbf657df81b10838d8d208d01d6c3c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
