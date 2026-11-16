Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862540;
	b=DL4IPyWtJDTI3Y2JAgDNpGpqRxNT2apP7A7+mu7LW0hZbUNj5CctE+jZTV8Q+UcVhlew
	 v45Prx27pD+jZa9LvZVc6BepKaRB0Vbz/JYK607fDUz4IIdkZq0Xk6enfdkBJ15GP1pbH
	 S6J6Ffxbn78wzovaT7igcX5otzhrLvfDqUdO1dUt2KN04QzpKwgcfk29ca3U7G89qFNDT
	 Cv+F7IdNSuqbEdIG/eYOGE4PnI/qdYVqTZqmQlssgjuTClkFT26hbX2tUBTVToTtVPEoY
	 guqew0PFvRaG/0OSegBcotU4OF/9oxKV61PI+R5nxFL5UC+D5xYmtFOLy2lvcduk6cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
	b=XdOOwDk1Ns/BEo3E6Fz4WAjUMIz9fnae4sjmmEwW5c+09YekqiyfQvhiypRnuDlHnwF1
	 hIOB/yadk1cgYs3Bnw00Q/bqY+xJm+q9gOhDQFyU/RxxfcClj08UEiE+e9DgTrLUByihk
	 9IjMy8EVcv2rOymsd/OOiibAbWvDPQnX4K3nsg6k1VACa0AefyJep/rQGs3VxNOCfjRZk
	 bCYspjDZI/FfIYK8GfFVmxqF7nOjANi8v5KB07ygOOaB2HFKYVIlnleyNBQopVmTJesKh
	 GTk6nCbkW4mwbyRZmTArRKyzrlBbCZgjgrlc4/mP6yUJxVcC15R7CHTZLRsHdN7Qlqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2QgY5C3;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01070606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 20:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01070606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2QgY5C3
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1986860f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862538; x=1795467338; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
        b=u2QgY5C3if5uWiUzZPM8txeCtbFhDBPrzEMoHeTc5cOUW1a6m+yJEOsHyjTGKYv5Br
         2hSq/IcbD6pZi+sd73S4n67ieExHp6zRxGM9IjP+O44xbz09zLMWbowhMeyyRAWGbIuK
         Q7Y8RY0lJKTIww8tbVcR0rzr+fKDLuN29Fk5SxwLtIviFdn7AyBhOC4fGiNLluF5QZ0m
         G9wxEbaF3SDTPQzdEUBgPeNz+y+ca2sV/soJ0BzaWB6rstoI+PF8XC135FGOfQ3f4Ijc
         J90MHeSJ3ULZMvmhEqS7GuyQzjZtkGPyRlPdp6pUkM98FxRrWTlOGvcW6eoD3yUkCBkS
         hv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862538; x=1795467338;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
        b=KOeFN4WNA0t/Z6gtIiewR/7qACUSC7k3EL62MXNDGrrRN1zRwLhwTZM81Z6dC3NMlg
         2gIGD0kEzxZpcOeWH/TznxHsC5Cwyd/yJy0FnnpqRMS3B54DaRCvIFY/uFDL6+2t6da1
         r2OpmtnmpXbqnnmwZ5vcU4wY8gY6lqr2Crxul5jCatOpwD2szzOQEbs8ae6wZBadpEzF
         P1vcAlql7yj3H7GMf05D+NiSHbVPpG5PnwpD4aykHbkCxyAoYs7YCaguLMFwAfhYsrol
         mf2m6vqJC+4XlyDy4DhIJSMoGgRjjk7oZPKbOMUx1HQa6bZTW/n+oMhB7sTZZWfYWIy4
         IVtg==
X-Forwarded-Encrypted: i=1; AL+hErFNN7CtTLmxER24kHi19a8UUjkoEaXIctx8dJY4vi+Pk0RXSqkUqHAoCK/TGrME1qq3G2o22rwrRxncIPue@vger.kernel.org
X-Gm-Message-State: APuU4Z+rrIm1Qh+nDIOUkFlS52f2dRy3fYANoV0xU/pHy8YQHLzpJya4
	/xTMrmilCpo2PsU+3PBgdMt80YZw40EDsRJLlnnux2P18VYtrklU6p1v
X-Gm-Gg: AZFdTZcoBmD1DwXlcT0BZuedtgIgI1Frvi+SrlCXcq6yM+lAxc6wB5KaEw0YGewSfL6
	MVCOZP8G8g0TFrz8zpa7PIN4hqkULHsZd2xrSSLE4YHvsXEMxh/zm9tc4Un4T7rNbC5q0oW8C0M
	/5oK+T5R6HgHY9ZjMnRb6cWcjywsKa6DU4+RANMSwwyta89oM3PoRzOxX9agIQwhOj6bCVzVq3y
	Q8I3DK6oJCMLm5O5xH1t+pI7vDuqnXE2Fs1B9c0oi6RjZIH6uCu1BQFU0BbyXkQtsiz3fOAIWfJ
	EYw85lLMuzgpZGmeuJevFxTEJbrPQn3r6wMo9fTslrilpnWmRRsDw2KSISa7fT9I7ajCdLnpKAC
	nQqtkeqNo6xCq0wVbbHw6BsFl+jxWUt1P5V7oeaww66UFTczSJGiPA16+oiSj2xcM27ZJ96wg07
	iJO9R2bhnpQR4O1juUuq162bVoLBgg3k8BHZCc8aGBXoDdFFey7pe9w1v8rGcD8SL5Gbv33pJwC
	1CEEgVdOzdPWPt27id7RM8+VsQSNqaT2FUNy3KcnzRG/QBEY+E0HDBD
X-Received: by 2002:a05:6000:26c8:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-49c73631471mr27391944f8f.23.1794862538469;
        Mon, 16 Nov 2026 12:55:38 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:36 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <954a5e65e7424694ba29836fba08c802@gmail.com>
In-Reply-To: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKFB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgpBY2tlZC1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29t
PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJm
MWIwYjRlZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9xY29tLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9x
Y29tLnlhbWwKQEAgLTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRl
bXM6CiAgICAgICAgICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYt
eDE2MDdxYQogICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAg
ICAgICAgLSBocCxvbW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5r
Ym9vay0xNgotLSAKMi41NS4wCg==
