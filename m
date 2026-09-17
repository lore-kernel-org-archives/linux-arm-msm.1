Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E604B7A4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657969; cv=none; b=otLE2BlYdAZnBMU/io0uuYPeTHCJK5iFvvEIG/mJDEooYisKqL20RekxJXwa0mUehNCyTqNo6hTG7vhU+pwwWTFCyPiTvonN2w4F64JgA2kz9fTM737IwBnWZC+Sxoe5PNgUzFHTe/YubGbohLeXCnFSw7GMkf342OfR0UKppC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657969; c=relaxed/simple;
	bh=SPc69jFFjRMj/dR/GiE/fnvPzv7uPyk/XhoC23aa3Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+h6Jxb62k6saYkMHMhzzIJJR0NTR/gcuqGLHHkzyyby/t5znLDeAI5UQXHb1cq4H8n/6vWW+Pb96+Ri0yuHrubEKwYWrH90tV152/fWBrA2b9syuVT83qvv4wPPy4zyIhzyqIEo9JRuA/Qkihf+gFAWTVZpIu0T0lAgtYpWXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4jqkcwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hl/JRdnb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4jqkcwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hl/JRdnb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HECl3U2496785
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NDh7P9dtNVKF6HTzLbhB6G7p
	UWmFKx46sTTj1U4KSZc=; b=D4jqkcwn61SbG2mM0Oj1IAlXtBs60vWRXHfCnvrv
	umtanNrHpUhV+K3jno8y7HIZiEafeKDhWhyU43enNuOtv+nUA3/J7gZMzLuterYE
	g5MxFLixnxQUSSQr4MBvKoZF5NEGZuN5/K6QlSsYgPZ8UgQwpx7LPktrsAzwyYv/
	0RXAIq/ddCKOJnoXe7pfKn/kBcuSnDAqLxbpKQ2oPpJijI6OVC1Kppb7vRoY5Kpi
	Mj+Bc92Px14YpPU6KtBNUwT6LoyOj5CZeZCXGN+EvI92fARXj4JgPfAIPA38JHaz
	LcoyBqdcgAUxoCd3iRrk6LigLwbFZ4qcIFO/bxZXyChv0w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6g9hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:12:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-912330dd4dbso20523966d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657958; x=1790262758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDh7P9dtNVKF6HTzLbhB6G7pUWmFKx46sTTj1U4KSZc=;
        b=hl/JRdnb8YmkLCqJ5oEplD/K3PLPY7ZzscqJaxGtDyA5QzunjVA7u2apJ0I376alRd
         NNIGrq2zfSOQ8WyOtthpvohmcy77H0cZfT4REpkYxfFBaUD6utFAUyiZ3skxlXWib40r
         C5PwAySSGSgXZ7omWsqJdCQj6FbmChMwO+k+cpKduXokTKOtWHMDHLGRJMqMv3jWuCLQ
         ELSRsnCeTkzVXBoxoow+A2p9RIyVamw6nNmGpHBooa7pRcDXHa6JvnmQY0NqKi4ZCgln
         PjMbXH6T++dYdkJxYhyNohZInIqLQ+l50Tju0pSUfKDp+SYMol+MZNme8Tg2u3y80b+f
         SMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657958; x=1790262758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDh7P9dtNVKF6HTzLbhB6G7pUWmFKx46sTTj1U4KSZc=;
        b=MTGhm9JC3VHF2K47ZU8Fqvg6byk3aLOcUZ5RI2Z5xi3qlHgxa29+jfxGV+2yX5U+XC
         kpwoKGc5mwMVDoG4xtrsSKuWiLS/4Y7O6aR2jsq6TVgaAvvOX5u33t6u0M+2P1hUjb4h
         L9zxPicRkp60l/LjFAtykZhQt7yJNF0kyRiMFZwrFBBAbZSGHJtGcJB6ZspYhNzpRtv+
         CPuUtmMD8oojRBatB3nOU5Z1Pa2ulravgDA/rcRB/cOjkic4AnaUsVOArW/JKzNqOgc+
         OHn/EjaMD19RpvmQ7NHR1cPoSnTSzog4Mex55EeMEgmckWDzZ4y8qDrrraRPAfraHnrh
         ashA==
X-Forwarded-Encrypted: i=1; AKwUvBwtYLyAzYJY5JjQM1out8gk4MffZLKgGPa1Uuez+LYw+IR8Y3cVb4tphgF240/N57RckpZDvihCZHRWbWkL@vger.kernel.org
X-Gm-Message-State: AFuF++k9TSITcomnd4a4HJ07qEIP0R18Hwh3ldf0Jlgy6JYO/jJ08yzE
	7SmGN1nZeLSBYtyV6ur2wFwH71YTZvaRA1OogDUyOZb5rZQt184X9BbSOKg7W0wORl/QBfxIarX
	cXJGH5JrEPhlOPFcUY9bpqZshNgm4Djbwhz3FpzfG4yCKYju0yntIYNRKaXVLQhzNV8ab
X-Gm-Gg: AYBFou1sTI+osSt4eAnskt07a5i98eNaJKZMpF81ij0RfxUCYwtrpkrjvB3b+5dJQtE
	lmW6x63sE83Q3kM/dlRtR2d50vTB30qI7OLU7v/IU7TCV569dm+QRM+6p7IyV8Vz7eoap3O0wZX
	8UNgi95ejhojMp/VPllqxsNAS0o6bRDhEEBmrXD/H8SXVeCru3MM4WgQEA9hWQxVfg22pgK+UUd
	ld1COzee6VNJFJZ9oOfoGHMVVtVOuevD4sqpWaJT4KpEgKbHW+b5+tXk9WlTVdmaCySDoH/AV03
	neXvJXSH3cEPbJWa53dJIlTiIAJ0ZAOBhNjrBSDQ7qqyFflg94pTZVUd14BP8UaMKMEUjvaPx0q
	L2zNmqHMh2+kmlA==
X-Received: by 2002:a05:620a:1789:b0:937:6f98:c68f with SMTP id af79cd13be357-93bc62405afmr515977885a.1.1789657957519;
        Thu, 17 Sep 2026 08:12:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1789:b0:937:6f98:c68f with SMTP id af79cd13be357-93bc62405afmr515971985a.1.1789657956678;
        Thu, 17 Sep 2026 08:12:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm131474435e9.10.2026.09.17.08.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:12:35 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:12:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/15] arm64: dts: qcom: sar2130p: Move PCIe phy and
 GPIOs to root port node
Message-ID: <kfyihddprwum6q727hvpyzg636erz4cd4t5hn7ubqwr63ffl74@iaui2pgf7wae>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-4-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-4-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX9Ds0oOmRhvmF
 JqNoUWNWNoRw3xL//eq6HSJWzFUivjONMyr4cr4pbTLuB6Oc8Za61IW+K8cKoDmtNfPNtREEsHs
 wWpdRUs57dHhJEGMhGticnRSmFZHVllFAkqTRKh6KR6d8olWQd1kE3O7FWk1yHEyIz3uY9Y0iyR
 /IFrLbY4b5elZA2WG5z0AfR0N2ZbHbKyXk9pGhArNZOGKbgPn9UtaU1onQ0r7Xla30vrNaQNQNm
 J7p09DQQm6+U5oRsl9yBuqovh85VifeOb/3sZ9lC/yx5vXRAVwmHtFl/YPuLQ2j2PZP/8m7ns2k
 iJwW637wwMsjKgI6jTKxyugqctd4jVS9XPQGuokXrTUcD7re2lnqxlje8T3osYx7qCW5wkTAK4X
 tpLXWEMUbvAP9qxjIAX7U7gq4OXx/1VgKeQaHhjORz4fb7SohL4yVk3ox252VRukQWJuVb8W+XG
 bSj54DIJAl194lN8vIQ==
X-Proofpoint-GUID: LQiNmC9a1_Xbnfbo0-EmlnU-TB6fpZjk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX3iMqviwNIB30
 AVubD+QUMkvrM3KkNVQAgoZjh5UrVUVPS8Tp3pQl2g5iHv2LiPDANlOrOMZEuXQxv3o5/XS9JTz
 tfU4h+14+X660gObRBpTZzh/RSiHgCQ=
X-Proofpoint-ORIG-GUID: LQiNmC9a1_Xbnfbo0-EmlnU-TB6fpZjk
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac0366 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170214

On 26-09-17 17:55:18, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
> controller override to &pcieport0 in the board file, renaming
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
