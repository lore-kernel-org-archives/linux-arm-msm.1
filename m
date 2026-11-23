Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462609;
	b=rPri+N8Zd/M8oTZXFRl3tYLwM7wlhJBASvgzfnCIWuvw614c8gKx6umc4zcPLZ3zJRdc
	 jawt03wm4flQiHQjCGELwJ9XXzDu3pZCZ/io9G+yMsJUulLc+xTdMgRZXJjCHrRyXok8x
	 NdjBeQLU5m979esxHeybT0oFPmTyvbDfurfDwiYeoy7wsOFBBGdXwulzLvbMYnirs6fJn
	 3pLmd7sRf/kg1IFIHkI1PQtGhRyasNy9SA7VL+i+IJ/B20TvS0SPfp29A6iFCVlY9n3yy
	 uXi4PGLbPS6MHwBBG1uSKIWbPlresLBvdpchvHpHCjlQeEtSMLNR/uEA99ZgbbBxR0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
	b=GoJuky/58392D/0OzkBObl+zRD7zQlZicsbXb1+KrnvUUZw2x56VnAc+/LAKWjNoE2Ss
	 egqgNRtiKZxG8fk+H57yu1trpVsNxXxe5snZUq+K9427s1naJsNvNHHPKTomNNx2qobDJ
	 PZMqorfAE9Mxn7YF0neo6mxX7kIMCVus3uO1DXqzEjXtHG2TYCEy/M/LrKw1xhrPmNks7
	 H2AjFuR6mpRNXjR0dZAmj+S6uzz2nAnB4AXdVGFZQzGGSL9mbZgIsySnqntfvIj1ySKBz
	 XklZuuctq2c6vHSSadwuiYQF+ovU0EKGaBEmQqpM9N5tRijqLyZ/pDtnUtMdMWz5lVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8B4606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH43H1093889
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6aU+cchuetqDtzjD9jSrzXmm
	5L9uzDfuqw5ewOyVopE=; b=iVxyptQyjbLdiD3MOBcuca1LHEDdlI/vq7mQDPNn
	L6TB/voo6VsCPcz55NyJQ2q4PbOshmC2Rzxl5Iahos3fItygEA+NnHwNcPP3w33T
	uWgi1qjKEPmolYVbfpX+3zntRn9lIsfl2hWnVmCWRUm5cV/q7TKAZL9zTuDAJs2j
	l/Vw8B8fzaKZNoUIkZk9ZvIwFl7eBD7cUQB2npHEWqwasg5QcPsm2Mz9XbhXOuV0
	QUhdTmByTU5OVQ1sQ3oO8qNmuIYcPKqGLQ44u/rKh5aVjloFkDsV2YfAH+d3CqdM
	UKs3aJBrTnJOzE9A2qSFxkhY7GpGQdwqlGkPsQc9UZWUxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t25g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:36:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so572251185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462607; x=1796067407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=bKAti34Mh7WNLgI2C9TuC+tqXFyihBwGWkk/rJotugXxvSJxfNzciunb4KOALivbmG
         BKDhp5fTyznyglrUoo2fYidmonWKVPnFX3zX/kU9ELWe81fzr22g7XAsiGq+og13RcsT
         zGNvvcDMhpvuMltMz2fI/l3UDLNldg6EAaStM4zfIsAUPAtFhLm1cde0UsraXojq9xyi
         jfZRnaoIITipuOxd/EMIKCn8dC7Sv8EmuFbTWHT7cWMHdpkc9f/zyX5tyHNXeJ5y7dYC
         H4Pl+rvtQTD9xYqfgOlMpc9IKMCoMb7k7lOsrOrDe/zcE6RAOnMPJCEwUpNES4xlsKaN
         wlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462607; x=1796067407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=UROiul9XRDYCg8zruLczyBahXbgVYo+8ggrnMz2DJ2f+Vj7gyJzwp8Vzc8n47l9e80
         2pdXRI6qCqolkCER7Nzpv5a4On7/lpRYudBfJMEP0sazSZwnCP+8r9K8bqkK8FFKsGx9
         EuVpus6NzZ2OsS2Bpf7FwwXK9z1y6kbKuCcrHXGuPrE9gfd0C7aTqlsh4eSElAWwbvO8
         ySi7EvkOQWTc7OKP0ZKtJxyEYUtghIUWZEOQsP6+t2mlJR9Z6o+uMv0V6ZJc+ViN8xMt
         lJC+auBOpDxEPXNpCLQRwoaOQCrAvYQwIjyvrbbkw10Mw1Bi/G6ntuANQWPp9b9VgYUz
         X88w==
X-Forwarded-Encrypted: i=1; AL+hErHW4lvzRWb55DRvbXpBJwhVgCujDbz6UD8zd0zHyAZoSKDH7eRwtUnx90tBxfHELjjTfy8Ugc9tzITP7EO+@vger.kernel.org
X-Gm-Message-State: APuU4Z9AYEEkiuP8aaeX6AKoM/8u04oRhyZlwu6yI8dQn+NT2hgGxRyr
	63ggkLy55nP/B1BasTzZW0vnSd+b5wcUWGHPz0KWAOFstW8MTqeaN0TkCDMPPLhBYscONlTeu4U
	YLvY5n1N5ArQLuj5/jYIlj9oIUW0/ZuZlokfKVIOGeBqlvEoRAEscObn3e90wXaklnvit
X-Gm-Gg: AZFdTZeB2syTnbftf6MbQ7qqebKb9Mpek8lysDKm7lmLqg1EX+BvViLhSUMVfI3yWrL
	juY+So6KZd8r82/Xe5aXhP+JAI2HMkF/bR9MQqaNOj6c33WutAqPFW2J9T82JPMnj/UgT0BRH48
	ngcWMCWdc+nByt48Hrb1TBtzHNVYtis78nEIc+xzDQ8pincU5UIBPJqOQdsZV+eG4Eni62Fryjx
	m/AgORWVTfasNwexxv3KmodZCM5M+pbgbv/zGGZH/7lrqAhgcvW4TQRdYXuwu088sE/49tXNsi2
	85l05IP2PBw3Wze7Q/rBMum+cZ0pZIZvjs+MBf+KIT4HVOCIYGpylJW0lvODX4D65Z6JEW7qNEo
	0Lk/KVBMKWt3e31zT3QxWvxi/1OQ5KBOzixHsMvpkEVcslcPGCieBJiQ+f1cYmogo
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280103185a.14.1795462606843;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280096985a.14.1795462606303;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm336356205e9.12.2026.11.23.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:36:45 -0800 (PST)
Date: Mon, 23 Nov 2026 21:36:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] arm64: dts: qcom: x1e78100-t14s: add WSA
 speaker protection VI feedback
Message-ID: <j4zssaws6gb4cico53bwweb3755agxwrunxao3ykvbpa4rbzi3@j3lkijgta4as>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: HpORunYjacmde6htkW7at66uPzyBzVBR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5AF1le9LUTLQ
 t1tlAj4PCjvnee1nMkJ8jSzOOeBVC3iH38hilNfcipYXMertOb/9sB7K2ftaRPX+JL8ktyInQeN
 5HDnpdtjEZDFPd/YrzAAJI8NY589gWI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9kL0XmfRHJgT
 1j3xJxEwasZkUgOFZOoo7wBIc0VXV6Vq/dLHwYAwPl/cTXx4SLFXZ3LLzsv0UbWVN5qj8XoSwG5
 dMy5WoQcvhSbhM4nTzGuovJpF4wjABrZQigVCvlNqkC6UJf5Ll3pvJiZ2INxbPoyg0tPD+IamqR
 S4EL6JmS4pZ/9BL0HhtPJQ8HjjCp2/86Qw9DjLKe7pVksDvchNJgWseHoNNdp6er0UGYBZ1xWQp
 ojuBkL8pLN7WxYLwyDeToZuJIO5zUiT5Zq77PSH9CihIN/QmBeER8T9VhFDtPH/ESRT2+0pTmno
 pGI3p8msJV3AgSAPtbRgPVCwkZSl4g4vXuTkkoV0qP1sK7JtUaDkQh0N2QYNMw1JtrYCvL7JcAA
 PIvjGEGGJrpGmDUoKneHqRB9/VgPjEs7ame2BD1buKlPVVmuDeFMYl0hsE8RV84PJP1LkQ8EOB3
 QLSE2LXE2l1JSl9a3lQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b0495cf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=M6omgQR0Woip3EZOlBYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HpORunYjacmde6htkW7at66uPzyBzVBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-22 16:14:37, Srinivas Kandagatla wrote:
> Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAI to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The VI sense master ports (10 and 11) are picked up from the VISENSE
> slot of the per-speaker qcom,port-mapping, which differs from the
> mahua-t14s Gen 7 layout (12/13).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
