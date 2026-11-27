Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779161;
	b=t3ZZ1vYkgv2l6iNvWpiRdx/28ITbmN6dq4C0jRB2GyLleqs2Y7PG+zDqxOCYMAlYvUML
	 4tSCM0wf4mNcbREh0c7BJogR1p5r33mL/CVS8k1E0R82yAgOoJqyAuTi7rfebrMzQQLWd
	 4ccpCEAhjHEhJjUVIADWmNFAZzmT8PQc9Rgr6r9RFEiSt9rAsgDsuxUP03bwcsFks+TLD
	 YIOxWzqag6N7lfEvjrPo1DcF+5dGO0trfZBcN380pD/MQg/Nt716ty7FaaveeUB7WvY7M
	 p9QP9tutWOeEUbOrHD46kExq/gDa73AHVj5qRUWDWljCYVJ56pRhdKoTd0XGGMUiP8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=k1UN9ByJdt8gEiEY32EyFVyrB9m74CQtwvIOiaNpM7k=;
	b=5F5+7Zpptvg9qQynW7hI7BpIoBjsWdfgMd8itb0gTDGUL5a4Rpet8E7YTeSJ9oPe0PZ3
	 Vw/Cg4B5tGtQUe9P8Pmw5oZtd7fcPtNNk0jvL/8jYpm5pkBnU3cveXfeshRKj2rzA93ZY
	 62CkAFp3RayKJ8nhcsP84xnJPkoxT8XJrx6roUCmN5mqCuq74qYIFbrLoeHVpBilRkzEG
	 RE7GlmAa1wswDbtT7DoaDYHG48Pc7alhJQuFIoVmM5Wy5+Av24khdKRzRFyx2ll9vQAtb
	 f/kupTJZo1dCE2rapPd7GkUkHVLLbnhRdF9HWMSSSuwU436BAQr2gZ6FvEm2lPbXskQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJZsTfMm;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9D0606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJZsTfMm
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso3271344a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779161; x=1796383961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1UN9ByJdt8gEiEY32EyFVyrB9m74CQtwvIOiaNpM7k=;
        b=YJZsTfMmWCC1ZRTnMufbgNhvqa8ZgXlXHXkxyq5nZ7eVsU8Z7sv09RhhvggKAqIhft
         uurl5KS/s5c5JElzj3uFZYfjxFCGtK9R2uy7wR8Gnm7Lswh7m4NBEF0uBBhV04QI1Dyw
         PNMzPh1u4VLMllGRS9Nl7y1v02spbgxW9U5azssv1WfYDRTi6gAdBWMcapfGFeqv9QlO
         zwhGr9VjD6JApfXVV6VaI5XcAXARIBOrBCJct2J2QYjdIR2dGDxovKknDzd2yMymy1xQ
         wI2vUYgtQSOfd3+x00zD9Z9IhWzc7kMRsmkTQ3hn5YvUm2Rjzp2QtE8BQVsHJCrksnY8
         Vr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779161; x=1796383961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1UN9ByJdt8gEiEY32EyFVyrB9m74CQtwvIOiaNpM7k=;
        b=oEZWpESvVCd09JkuReLOWWXDvzLJtq8bYM0eLFdGq8TFP05JpTX4EAUtVmomYFWizi
         waoNpjyPzdyYGt0kgo0tjz4DVVLVxTViqF97mefnsWal1xYMZJfZl0FlxVOU4yHMUeze
         iYFYrPfCCAiHkJaVV4UvoRHCqqTW0t2RC6eM3s0ZbgMwFp0Ggg2OANaJVrTaT3GW3EAu
         7f2zSvWoij9IZB0OAPNsSHJMpxHWlGT4lS60+X1gIBpAh7Q/wTFdFvTVQSIEGMFZV8+I
         o61RNzt6qo+gLT0U3JBOIXFwJeoRobMrYOZRiN/TKIiPXPQADDT3mRYYc/JpkeWkwDPn
         oiiA==
X-Forwarded-Encrypted: i=1; AL+hErFQDgQTM8d1Wk9wXAAsQ19rRgKsCxsVVLiIcVPqAhxh7pOisVVBc6aVMV+hhHromwWt+nJwbcdsX98DTfQF@vger.kernel.org
X-Gm-Message-State: APuU4Z/+ER2avig054b6t/VXk8eCGrJayrx1P/EanglCvWxn701UG6oc
	tM/ubwLv4CWtfwo6psYIBQYBYowkZclTXNbIvc8j8fj9icQKmZUsfodb
X-Gm-Gg: AZFdTZeMT3cJvePBYYOlOHQ2SLugd7U0E12MDP7yAiD8dGTpcdOdjBjnAJTGJJIx7tt
	iegYaKdOJPS8ahyVLZXoI+oYB9Ro8QMd9cBvtpFYtj2SjOqYuTA7h/4pOqHLhcIl/rXe+D6eRUc
	Ua/DZrxEVqWYY49rM57bxAV7AkcHz7awTmaVqVJ8iez/V8adKrCEfMKcU/PilpJxhaKqOCBSe6M
	5gb0/imJplAOTmtEOmiYrb6ICBrUskQ9eoZRNKOobyWeKrulG0iWFcr+St4oOawGTVjj8RxjBj5
	6/uepS28mErDuQv//hQbCYkhNRkB13Sg4Y5il4YpsrT3Hw1WdUlojQonqvSRtUxQdyaU8TVFVBV
	uEmgRQSVxNElyOsNo6ZorkIKOwkCZnZxNsA7cNVPa+4azy3k0qcnrSOW0vXAAxSjfgBUr2LGg+I
	aFr0AXyHdPeLi4IMsDDgBXFxYZm/6VglYqaghi26mXqDlm+n/jrmfPzfcikWSobsvEV/iSvnDLc
	o+mtQLhE0JNFZlDT+gL4pIV0o4kGX94IKBmc4XzAQ5SFZXK/2uqiyfHCSNeC4FK8nC6CxHNUGH6
	RGDw+JuH0jw85Lk2laLkaWNuxmC09oN4jN4jDK+yuf7TFjlLSjBk
X-Received: by 2002:a17:903:378b:b0:2f1:6bb:55e3 with SMTP id d9443c01a7336-2f106bb7460mr30758615ad.46.1795779160799;
        Fri, 27 Nov 2026 03:32:40 -0800 (PST)
Received: from localhost.localdomain ([2406:da1e:5db:e000:2565:a988:ec63:8010])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04a49cfffsm109897425ad.46.2026.11.27.03.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:32:40 -0800 (PST)
Date: Fri, 27 Nov 2026 19:32:30 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi elish
 panel variants
Message-ID: <awlqTvcDwcu-7B_Z@localhost.localdomain>
References: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
 <20261127101942.3215633-2-liujianfeng1994@gmail.com>
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
In-Reply-To: <20261127101942.3215633-2-liujianfeng1994@gmail.com>

On Fri, Nov 27, 2026 at 06:19:19PM +0800, Jianfeng Liu wrote:
> The Xiaomi Mi Pad 5 Pro (elish) is available with either a BOE or a CSOT
> display panel. Document a board compatible for each variant so firmware
> can distinguish the corresponding device trees.
> 
> Keep xiaomi,elish as a fallback in the panel-specific compatible lists
> and replace the generic-only entry with the two panel variants.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> 
> ---
> 
> Changes in v2:
> - Remove xiaomi,elish from the generic SM8250 enum, as suggested by
>   Jianhua Lu.
> - Add a Xiaomi Mi Pad 5 Pro description to the Elish entry, as suggested
>   by Jianhua Lu.
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Jianhua Lu <lujianhua000@gmail.com>
