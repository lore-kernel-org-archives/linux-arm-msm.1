Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444487;
	b=TkaUNPtoic8JjvR1R6PqwdvJvHrhwcxNU6Gyk/OZIDEgP75BEWGlj1GzbXCzapvkIZnL
	 d/oGOBsWcN9xPtiS3ITzF/ENTPIfdvJkacyttSLFT2YgZSusHyU0a+ABdzouv231D/wGd
	 bUvOBSBy+fPAtTxdl7Poo4o2qRwZdHslx/7jVO+Z9Dbt6LyziURBiGzWvTG3M8wMswnAB
	 q/go6xzXBdDSVe6Y/PrJTIkEteS8SB/XzgcCaUUtf06atnpeWnCw+9MwRpWVWqoPjkjbe
	 5PJleSxdC2SwbEyzR+im0dz74iZ+Cdu/tdgVSVEJ//kDJuvDcLJDP0j+CVEvTh99DZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=;
	b=Bp4UQrTslmPDgA0BDrvibx1qEJJOiembtCK0qN1Y7Y243+2BV8FPIhzbpr7cCh23daIj
	 Yyqmq9j7b7LsObJuTyEVbeGZlN6HboFGEkPAjwi8/6NzRZonv16GrRVZCOpEt2lQcrPYd
	 pYKVwTn936VzvL3ghidpGKu1iZMpR9z17WF9EDjJUVjCUoTIPif0uhtSHAi3R+w+VnnK2
	 rpgkP1LJgwQlsT8KFL+qpK9lI2MoVcOA2pRkRMYqG8GKy+ZN8z7091N3wOySR88718f4B
	 FoXRVqfH8f/ziUkmtc+yc08u1AJtyB03Sb2fwUlCvvLQhrk3MNA+cNT9jXR8ZQM5Zxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IBdhDM7/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C3j2/6nH";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8484B606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8484B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBdhDM7/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3j2/6nH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL1U03072474
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=; b=IBdhDM7/3HUZSXDT
	STbqoNJPo9owgso9UilkDQ1JQnpWHbDOcojnxddccFlu8fewo4UUTQCb5yeoLf5C
	eYH36bKEhGSvqXQYmNFDn24gGNkWvr4thE9CrnjSerhEdQjMrmC2ifUyRaj3NAwd
	Fx4UYOo89OlRGkyXhhHw+KjlCUeTb5kBSl4Z4alesXJ5rZ2NCZi0fnniQWRth0TU
	K2PpHRW59IbpFVe4MTwXGnKxurv6P65/tYxVWmQ70jNRfoD0FCLxik6zxMFmRLEL
	0NAQ8FrB/kNcxbs05EPw43SMrL7u53rPzXF/UYaYJ+OE8o0qGS7ijxuuGB9EmKhD
	zYlOgg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7sfea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:34:45 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b2fb1f981fso44339437b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795444485; x=1796049285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=;
        b=C3j2/6nHdZtys2QUDXUO0TSbFjIwSOOANliTHWofJQRWUOcJ8zKb+SXYBZ1ieXjyTi
         0FoTs3QBKBtDS980V7RJIQ12r3l4HI25cHvVNdiFCr3FfjN9S0bqswUeK1RjPvmpp0oH
         aBMthSs2HYmswSyPDdYv0mf0A2i0xr78+cJvDBlyk3iw2GAcp904Kef4IOJmuOgoSXPC
         YJj5G27TmvzPwZ1CrPjz2qvZ/VTGjCMNGAukaaE9eOzZXIBvzZ108y68EpQLaZpJXukw
         BCY2W97hM28VCbBcSABWoU4CR/yOXLuyXz3vPAT8xY5TIGcXBhbnorRIxEIVHbqQC6Hl
         ralw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444485; x=1796049285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=;
        b=N3Otn62PQdur/DukDPzvA00ZO3yneqEX2+QeclGkWtOcwyoCRKnTkjYgRZf54DnS7e
         WUDeQ5xR523o7NtDO0IhXfFKNhGg2I6KcEzOMqXdI/ungQfgGd7rOWKzbcey6DCwI5Tj
         QhrT4DloByDogigzhur21FlU3jM7Agr2BthvJgKE8rz6wvPeLTkdE6iwsHiEmCbcYMl9
         APu2sHCVy2B6ri1A+WJRbIzF8elemtea4YsZbxxMKf+aWIiWUoIOeHWm/wa6vCb0DPJ7
         FUJtZglwCugmh++erboVAKHG6stYWuC/SFPBKCMjWKSJuToMKarmS7COXLcqxGAjBWVb
         THmg==
X-Forwarded-Encrypted: i=1; AL+hErEO9J9Qt/YLTIzrUJ0s4RPeh+dZEE6CZnANpJMYXxlNafi7SheLs0t0MEXZb5QMWyTokasGW9bYGjHio+a8@vger.kernel.org
X-Gm-Message-State: APuU4Z+DEFpyQZ+Q6XOj/4wYAuYX+bWdHENslOPrTWee42KRWTr+ayqz
	zwmgO+OAWTOT+CRyJCw6N88Y+Mqlo8yKMYtGOCQvBbKdvAUi7Imucd/xR6U9BREz+k/tjGeG8r0
	u+gDZHlFsRAd8PiYxuuG372iWR8IdtlDIBTDSG0DJ6KRpC2Aay8i8/oThNcfhEmrbKgGD
X-Gm-Gg: AZFdTZc8unck2vqMRwn/McJ7kwVaQuG5zr9A7HoOMDknZpBeTeINqt6g8XCFw8wTFS2
	DAYTuSoE+ICL627nn6eCy1ZHhcDaQ8g1pEai7ZX10qqDxeiqmRak2D+sqnijut/MHwwZFU0tH4j
	VqFlz040X7JEAYlv/u8LVo26/wdbHjQ6X+TvJ+8XMAPwiy9nGjLycMgscb/OXrX+i+yd/+ueBnO
	m0T3g8avtAGoUO4ezGpmePHV2jPJLjwFWoC0M0cC2WgSwAmkpIMGnle1xPo52PBqkUPs6R92Fy4
	YSqMwwKn1Q18sr48fKmtRQH2u/NTi564zcI/F6QFDFkU9JRT1cKLFNnsktec/AujKpEqDjTAQUs
	Q2kE51Yqn5Fmr5iPWz8hrpHAnz2oGskV6ijTtyZ/fch/Cq6KjXzXncgvOOCDeA54wnHqyzB2Pa+
	RV85bXF8y7VbxsJrNRS5+GhkOdqRHHcaQQhWKwFr+q1a7uqLMLLIwoOGO7SjLJdw==
X-Received: by 2002:a05:690e:1c1c:b0:67c:1dca:7e0 with SMTP id 956f58d0204a3-67e03cff709mr2905897d50.14.1795444484815;
        Mon, 23 Nov 2026 06:34:44 -0800 (PST)
X-Received: by 2002:a05:690e:1c1c:b0:67c:1dca:7e0 with SMTP id 956f58d0204a3-67e03cff709mr2905869d50.14.1795444484149;
        Mon, 23 Nov 2026 06:34:44 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26263469f8f.21.2026.11.23.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:34:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH 00/18] pinctrl: qcom: add gp_mn mux function across Qualcomm TLMM blocks
Date: Mon, 23 Nov 2026 15:34:40 +0100
Message-ID: <179544447632.77146.14884722918215310109.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b044f05 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gHIesgCGEubIfZZWx2YA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX/Avo8pA3sVjf
 APWCQEsco5rjwu+mFpJ/lD2r4yQSi6mUe4imXgfGrdgK87eRVckz/EN45lUOV85JMIpTNW5OAXm
 5iY9uGBjq8rOIRKjaKXpqVAQ7arpJd4/zKWq0Hgq4K0ZjnkGgV2TCfuL83LXyPnw2bPE/bs5EKx
 c3IWJ1KDiaZfwr8nSKEO9Nmcg32i2JOgk4uSUP5/WW2L7FUrk77c2hAmtV3Zf4Q2oeMRt+fMJRU
 XHpi2J+8BaGDFbbMD6hZh45zGPL7pRWiIDAOPUJCE0cvOLO7IT5n97ztFUAkqDXBIEqpYrHXfuX
 wrJ7LsKaK3tlBgrYVYJvTH6kWHZQG2V5LOTkcufvlG86oCtcIKj2Um1NgBMBQuaFun+nxIDbSI6
 QxfWguVem21xPSkdbsW621shSvoZSLhIdT/ki1Wxm2DbeCIa382FNuI0WtjqKj8xidsM8ItDQz3
 dqLG0h/5AaaZJdhCPPw==
X-Proofpoint-GUID: XHu1MWGtGmJHKtZp7-yxvO69BK1wjUip
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX3ARAqu9EUlxS
 8rf4UXJgMdyg1aprpq7FCB1yAKY5jw31Ak/zr+eAY8DRD/UxEDCP0lt/aIsjZoull+XWhEP21dE
 vkzZF+R60psQefN1mvzPoqYjRzyy3rE=
X-Proofpoint-ORIG-GUID: XHu1MWGtGmJHKtZp7-yxvO69BK1wjUip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230057


On Wed, 18 Nov 2026 11:32:31 +0530, Taniya Das wrote:
> The GP M/N divider generates a clock output that can be routed to a TLMM
> pin via the gp_mn pinmux function. This series adds the gp_mn function to
> the Qualcomm TLMM pin control drivers that expose it.
> 
> The driver changes for QCS8300, SA8775P, SC7280 and QCS615 were originally
> part of the PDM GP_MN clock series, where only the drivers were posted.
> This series adds the matching gp_mn entry to each of those TLMM bindings as
> well, so the binding and driver stay self-consistent. The remaining patches
> extend the same gp_mn function to additional Qualcomm SoCs: SM8750,
> Kaanapali, Glymur, Shikra and Nord. For every SoC the gp_mn entry is added
> to its TLMM binding enum first, followed by the driver change.
> 
> [...]

Applied, thanks!

[01/18] dt-bindings: pinctrl: qcom: qcs8300: add gp_mn function
        https://git.kernel.org/brgl/c/98215755f97c9442690d7006390a6dd4fafe2496
[02/18] pinctrl: qcom: qcs8300: Add gp_mn mux function
        https://git.kernel.org/brgl/c/d44c2eca9f49c89e566368dc38aacb1cb0c2b1b8
[03/18] dt-bindings: pinctrl: qcom: sa8775p: add gp_mn function
        https://git.kernel.org/brgl/c/942cc68b11c1a99e0cd0722934135bc0585f2352
[04/18] pinctrl: qcom: sa8775p: Add gp_mn mux function
        https://git.kernel.org/brgl/c/04a448e013117a53f138464a3adc3454407e21cf
[05/18] dt-bindings: pinctrl: qcom: sc7280: add gp_mn function
        https://git.kernel.org/brgl/c/4b6560893c646794835fdd89643e9c71fd0ea870
[06/18] pinctrl: qcom: sc7280: Add gp_mn mux function
        https://git.kernel.org/brgl/c/dbb4b922fd5e5f6f3bb8b6ecf1d48aa73445f98c
[07/18] dt-bindings: pinctrl: qcom: qcs615: add gp_mn function
        https://git.kernel.org/brgl/c/0d3cf110ffdb691742c3659508d5023f15d509fb
[08/18] pinctrl: qcom: qcs615: Add gp_mn mux function
        https://git.kernel.org/brgl/c/5308e218e3c2cbf9cfafce322b3bdfbd71b258da
[09/18] dt-bindings: pinctrl: qcom: sm8750: add gp_mn function
        https://git.kernel.org/brgl/c/0cb5ffa9eb0ce97db86106d298d2b39d55680c81
[10/18] pinctrl: qcom: sm8750: Add gp_mn mux function
        https://git.kernel.org/brgl/c/c24a092390a21ecb61ec8171b41fa289d27418e9
[11/18] dt-bindings: pinctrl: qcom: kaanapali: add gp_mn function
        https://git.kernel.org/brgl/c/d804723bcfda3f2b30618aec18eb1cc0881ea13b
[12/18] pinctrl: qcom: kaanapali: Add gp_mn mux function
        https://git.kernel.org/brgl/c/dd9ecba27b981279e2cc84a225a11c7c6308ea76
[13/18] dt-bindings: pinctrl: qcom: glymur: add gp_mn function
        https://git.kernel.org/brgl/c/844b5b901910df4718171519fb1393e2bea57bac
[14/18] pinctrl: qcom: glymur: Add gp_mn mux function
        https://git.kernel.org/brgl/c/b1922656379ea475bfc5c0f21f615c4eddcd0226
[15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn function
        https://git.kernel.org/brgl/c/36303ea598135dfbe30c77773af509ba32542795
[16/18] pinctrl: qcom: shikra: Add gp_mn mux function
        https://git.kernel.org/brgl/c/c16f39dad1bbb9dc10886de1b113695166d60bb9
[17/18] dt-bindings: pinctrl: qcom: nord: add gp_mn function
        https://git.kernel.org/brgl/c/0a9a2a463910ba341fc12adf362227f730de7aff
[18/18] pinctrl: qcom: nord: Add gp_mn mux function
        https://git.kernel.org/brgl/c/e19e48b2e6c603ebd4839153a45294a9c416e083

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
