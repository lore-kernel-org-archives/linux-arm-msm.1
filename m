Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738845;
	b=fsv0stWV33LhmGDCkYmqkqJyDYIxMNp/+3OOKqr9WqDyDu8S/BBYQFQGNz04Ev+axLj3
	 jATJxAJdCkNdmy5X109I+zm+BsVok8Sgk+1VyAdz/jWWAANLmwtj4galg29DPzLWL1LMS
	 6dR8tcrpzA9jN4SUG0RMDcMZybELnoOTaPds376NSXKKFNRnTDuCKNzZ2IR8GygJzGgsZ
	 Ft3BFW7xw1zgD0yqaJhxznho7DdOahL5EfiFjZ5VS9Ml31ETnkanDQxbMqE2zkGByD+pp
	 1fRtL1LqKFJOGUPVxTBJUyohg755PJYpudrfcrpjw7kbwiWtR9aR5fVpofBY9U2BMgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
	b=dLb4bG4KsxEsEsk0p6Yv9b3+HYs488Q6Coh7zbxxV85nklj7Gcq/WFkqLo6fFW4XCSHp
	 RC6I1/5Zb6YJYlh+s2haheTH//Jdv7poQl4U/xkAH+iEJKc/tozyu9pCJaVcmPhUcJqNq
	 c42xvNy2LU1dS38xXfmKoVI2byYb70EmazyKYjdU5/HRupbeeP3Xi2rNOHpzNagyG7D4y
	 2XKL5VjS2Mdc+iVwk5+3/cvf1+IpKHE+hzT0zrRtBUhkeYtmL2dCyC6EzF2NDrGqFkEi/
	 mjIHCZzoZQBKj8VfdTrlQ7DISnuipuimzkHt+ChNKS4EaNasXjxP/4v0f9QqSjeG4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0D2606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0D2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EtKO2389423
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Li6ecssWAKTyIqGTgzg996bM
	uxChvYuVzdJanfbIoyg=; b=IUSmHvAsgjbRvDHLbpw4xaj5zBPceQmfN3MLm7ZP
	mnLR1VvyQ2kZWRjklFKANC990rumGPWaIPxhGNHbhtdExLqBDW3WNJ2tsA6umb8o
	1dUshLtrNa/dSh3gUBmI5WQxtzjzGEPeidxX4So+81Yn+p8iQN2s5sgPkz9/F9mf
	9AGoFD9p4bHS0yBRwvq4WtAyIRv35LbK2ukBHwgk8IT1tR56zS4Ssdiez8cJV5rz
	Uo+ctmaH7uzwBS1OXopAZAT3nD8u7lNi57ihjHzvcqUwynpEYKSjsO2tCMKSik7L
	ZKCms9yi4lzAtnLSO10oXjFmINAxk46Nuq/RxmtwUBcWdw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpabuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:00:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e94a7893e7so1011195ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738831; x=1793343631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
        b=NYJV1nS/xhKwj/O96Fsh5VvCEwW2ttOfwNdkFQctxPrLlpEPV6XHFGRUXiyTUEfmHz
         Gks9vQjbevYihc9WoKJKyMTjr1ISkTZOcZhg8pzEVVs97L+P+RgmH047kgQAPG+ejmOP
         rpOXAeL2VqK10+ZFQjXrY97WJ+ZTiDSDKcGLFt7dsNhEf2AkVFLOOhiWVa00IGZZW0Zo
         MN/6+z+k2uk1/md+7/Dy/2fuw82shV32Ux2miiItesRTYNsQXWouj5weHXwatMcMT7yo
         NcHggEpJApEhbAZYPnOBpQ8nd0eR9iDmclg9/s7O4OFVVNgFkc/20UpYClVHGF+yZzBT
         +76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738831; x=1793343631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
        b=QOf5a0HSjUgh+qY/66zkuVmwSsVkE0f7+sfDnNo7wCLzdm+cQyFEvi0kNioFuhuD6b
         vw1wnj2Ss4uqJoWdK9VXqT5pSIsOIhlENnf+MNR4+fiRXrPFfXYxyti0JgYFC80SQ1wU
         XBJS6nF3kaZ7za8yISMQxNbjTNcodpLJAq50G3iGFUHgNNEsHvhP0PVrS//ItduvcwRq
         INeS+6LEtvTRkAT9fKQrwSjEWqvb+uluEVF/eeAvlv+TW81LnK1n3Ga3lmbZNKqp3Q6r
         7IlafIsd1FWKIRQZmW7P5t2jKYcxms0N5Cqwo8QE+eNxSzT85xzGkfPF3Xc2eOGVLKK0
         QZkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhdVw7rc9A9qxLgreedBDzQvNlQ5PZk8pXDSjukZemE42CAyJ+45ya53vjnIHtLPtJ0RWfl5aK7tS8bMsX@vger.kernel.org
X-Gm-Message-State: AFq9FYJYvj+Lx1CuU+XH3/e84XpHZO8mStQL3g8WxY+w3k9imhQW0ZfM
	G0O3XoLD6CMVrrjImIyoLAjwMC6/lycVIWaK+p1GRWndl2iSlAPKDzls6YhdjW6whMzFeEZ75Qi
	l9mkizJLJv/oAjtKhhFUDZBLtcthMWaSEQsivia9HrxiGRxwMGnSuMJEoLR2O6SsGfBgj
X-Gm-Gg: AYBFou1sQonCzfeNLlyBk4EB3WMOyauKOfSfHFEFy2ypNRSR0kZ8YCl5ra7QMYz3HWN
	8wsYxCmojKJJ2qwBlqCi3vNrRHKrqHPojALEsdjfMK9aJLFxGbZUga5vvUQurxrDXhNnR6jxoqP
	4UXIulopR9uMNgua8ClfSr2VBqaW3BVG9YuwLVOnN+lE6//lemOO1XVN8c0JgszHsZsFIoB0I+5
	1lJsTI5tfb4JIOSY/U7OcQ+XpykQ0i6eFRnmiDtEAPU3i/NMx19+kdYNNr8tgYQlwjEwPrm8mKF
	QwoMVlZiCH4Z9KIz8bw3/g9jINb3VlROFzAkCNTIQCB8djAPA2KYOFWPn+bK1MBdraQkNrr1Piu
	RuHi+pa00eTbJ/Enll5U3dxbxj2SV70vebQEjTAKLYlecGxviW7rKEmLEURVnBI2GWrHMowlwHi
	qewisxoYatNTxYFnQgyanUoR8ycvabWQ465eWpj1N3VRMqmuQZ014=
X-Received: by 2002:a17:903:32cb:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea7d0c87acmr20794165ad.3.1792738831225;
        Fri, 23 Oct 2026 00:00:31 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea7d0c87acmr20793695ad.3.1792738830688;
        Fri, 23 Oct 2026 00:00:30 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3bc54fsm6202865ad.47.2026.10.23.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:00:29 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:30:22 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 4/7] arm64: defconfig: Enable RPi touchscreen V2
 regulator and ILI9881C panel
Message-ID: <atsGBkugguCQmOo4@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-4-adaea735999f@oss.qualcomm.com>
 <4b05475b-443e-49d0-9bfd-d78388246706@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b05475b-443e-49d0-9bfd-d78388246706@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX41Ls7tundYUV
 rVMbH+s1hav0YHdEw/dlFEj874oXhVkFmeXGXYuUz7E2kzIAF1MsjeQSxRlBZhju93dFvZewI5w
 eAu17yypfTbyucE8HJmwH26b5fBNF9Y=
X-Proofpoint-GUID: 7EOumK_CP0OHo7CHF97YOdjSkFGZFrcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX2lO08rYVPW5C
 jw65cf7wImqKdqmHoRNl5GXItlTxKuM60hq+dT/BLbReL28vm2NhfoDHsrizSnW6xvG2/BImlvw
 7yijqoNM+PtfPDEW+ZsU7CPyuEbH95VpyHVxun8DoooiwGwtILTlv0ZEQZpKKXqYsYqY9FTKWuO
 04y+3ZOBANo4wY9QZ71AJGAlhlclHlRi/1AeTRMDiSKy15YZh4ltKutLtblSp9VEY24p/lX40nj
 7fo0XYQVbh770gFGrkCzcFNNbxglLKQ+UM6kQyDZW7V4ZzrsAS/fCGJCj18g2Qz0ybV7pcjflqw
 RPmjhvHpv/tnQauGF1iTV8nqS72xC/cnW6D/YEnOuTmMt2YahIyttICc73GEAqk0Dd3q+Raoilu
 1ONJpCx/jhw5cpVwUyCCK5NR2piOAYtqI9qgidWmWTqjsfFFUa+bcCbdYDB9jBAsCFZH4ztiRyh
 y8s7BX2NQ9SShLWtSog==
X-Proofpoint-ORIG-GUID: 7EOumK_CP0OHo7CHF97YOdjSkFGZFrcF
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb0610 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=nis2Za4te4CX2erPvBIA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

On Thu, Oct 22, 2026 at 12:45:50PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 16:21, Vishnu Saini wrote:
> > Enable the regulator driver for the Raspberry Pi touchscreen V2 power
> > and backlight controller, and the Ilitek ILI9881C DSI panel driver, as
> > modules, for the Raspberry Pi 7 inch DSI panel on the 22-pin JDISP1 DSI0
> > connector on Qualcomm Shikra EVK, Talos Lyra EVK boards.
> 
> I don't understand - next commit is saying that it is enabling this for
> "Qualcomm Shikra EVK, Talos Lyra EVK boards."
> 
> so why same work is visible twice?

These defconfig changes are required for the RPi panel, while the ones in the next commit are required for the Waveshare panel.

I kept them separate per panel, but I can combine all the defconfig changes into a single commit if preferred.

> Best regards,
> Krzysztof
